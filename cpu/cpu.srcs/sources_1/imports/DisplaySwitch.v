`timescale 1ns / 1ps

//
// [Conventions]
//     BTNU: ordinary output.
//     BTND: memory view.
//         SW[15:0] - memory address.
//     BTNL: PC view.
//     BTNR: statistics.
//         SW[1:0] 2'b00 : total cycles.
//         SW[1:0] 2'b01 : unconditional branch count.
//         SW[1:0] 2'b10 : conditional branch count.
//         SW[1:0] 2'b11 : conditional branch success count.


module DisplaySwitch(
    input clk,
    input BTNC,
    input BTNU,
    input BTND,
    input BTNL,
    input BTNR,
    input [15:0] SW,
    output wire [7:0] anodes,
    output wire [7:0] cathodes,
);
    parameter DisplayOrdinary = 2'b00;
    parameter DisplayMemory = 2'b01;
    parameter DisplayPC = 2'b10;
    parameter DisplayStatistics = 2'b11;

    wire dividedClk;

    wire [31:0] totalCycles;
    wire [31:0] unconditionalBranchCount;
    wire [31:0] conditionalBranchCount;
    wire [31:0] conditionalBranchSuccessCount;

    reg [1:0] state;
    wire [31:0] ordinaryOutput;
    wire [31:0] memoryOutput;
    wire [31:0] PCOutput;
    wire [31:0] statisticsOutput;
    wire [31:0] outputNumber;

    ////////////////////////
    // Module definitions //
    ////////////////////////
    divide timeDivide(.clk(clk), .clkout(dividedClk));

    CPU mipsCPU(
        .clk(dividedClk),
        .reset(BTNC),
        .addr_debug(SW[11:0]),
        .v_Syscall_out(ordinaryOutput),
        .v_PC(PCOutput),
        .v_memory_out(memoryOutput),
        .v_total_cycles(totalCycles),
        .v_jump_cycles(unconditionalBranchCount),
        .v_branch_cycles(conditionalBranchCount),
        .v_branch_sucess_cycles(conditionalBranchSuccessCount)
    );

    MUX4 statisticsSelect4(
        .data1(totalCycles),
        .data2(unconditionalBranchCount),
        .data3(conditionalBranchCount),
        .data4(conditionalBranchSuccessCount),
        .sel(SW[1:0]),
        .dataout(statisticsOutput)
    );

    MUX4 displaySelect4(
        .data1(ordinaryOutput),
        .data2(memoryOutput),
        .data3(PCOutput),
        .data4(statisticsOutput),
        .sel(state),
        .dataout(outputNumber)
    );

    SegmentDisplay segmentDisplay(
        .clk(dividedClk),
        .reset(BTNC),
        .number(outputNumber),
        .anodes(anodes),
        .cathodes(cathodes)
    );

    always @ (posedge BTNC) begin
        state = DisplayOrdinary;
    end

    always @ (posedge BTNU) begin
        state = DisplayOrdinary;
    end

    always @ (posedge BTND) begin
        state = DisplayMemory;
    end

    always @ (posedge BTNL) begin
        state = DisplayPC;
    end

    always @ (posedge BTNR) begin
        state = DisplayStatistics;
    end
endmodule