//========================================================================
// utb_ProcBaseCtrl
//========================================================================
// A basic Verilog unit test bench for the Processor Base Control module

`default_nettype none
`timescale 1ps/1ps


`include "ProcBaseCtrl.v"
`include "vc/trace.v"

//------------------------------------------------------------------------
// Top-level module
//------------------------------------------------------------------------

module top(  input logic clk, input logic linetrace );
  logic        reset;

  // Instruction Memory Port

  logic        imem_reqstream_val;
  logic        imem_reqstream_rdy;
  logic        imem_respstream_val;
  logic        imem_respstream_rdy;
  logic        imem_respstream_drop;

  // Data Memory Port

  logic        dmem_reqstream_val;
  logic        dmem_reqstream_rdy;
  logic [2:0]  dmem_reqstream_msg_type;
  logic        dmem_respstream_val;
  logic        dmem_respstream_rdy;

  // mngr communication port

  logic        mngr2proc_val;
  logic        mngr2proc_rdy;
  logic        proc2mngr_val;
  logic        proc2mngr_rdy;

  // control signals (ctrl->dpath)

  logic        reg_en_F;
  logic [1:0]  pc_sel_F;

  logic        reg_en_D;
  logic [1:0]  op2_sel_D;
  logic        op1_sel_D;
  logic [1:0]  csrr_sel_D;
  logic [2:0]  imm_type_D;
  logic        imul_req_val_D;

  logic        reg_en_X;
  logic [3:0]  alu_fn_X;
  logic        imul_resp_rdy_X;
  logic [1:0]  ex_result_sel_X;

  logic        reg_en_M;
  logic        wb_result_sel_M;

  logic        reg_en_W;
  logic [4:0]  rf_waddr_W;
  logic        rf_wen_W;
  logic        stats_en_wen_W;

  // status signals (dpath->ctrl)

  logic [31:0] inst_D;
  logic        imul_req_rdy_D;

  logic        br_cond_eq_X;
  logic        br_cond_lt_X;
  logic        br_cond_ltu_X;
  logic        imul_resp_val_X;

  // extra ports

  logic        commit_inst;

  //----------------------------------------------------------------------
  // Module instantiations
  //----------------------------------------------------------------------
  
  // Instantiate the processor datapath
  lab2_proc_ProcBaseCtrl DUT
  ( .*
  ); 

  //----------------------------------------------------------------------
  // Run the Test Bench
  //----------------------------------------------------------------------

  initial begin
    $display("Start of Testbench");
    // Initalize all the signal inital values.

    imem_reqstream_rdy = 1;
    imem_respstream_val = 0;
    dmem_reqstream_rdy = 1;
    dmem_respstream_val = 0;
    mngr2proc_val = 0;
    proc2mngr_rdy = 1;

    inst_D = 32'h0;
    imul_req_rdy_D = 1;
    br_cond_eq_X = 1;
    br_cond_lt_X = 0;
    br_cond_ltu_X = 0;
    imul_resp_val_X = 0;
    commit_inst = 0;

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #1  AND, ANDI have correct ctrl signals
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // and at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'h0021f2b3; // and x5, x3, x2
    #1 // inst_D is combinational, wait 1 unit of time for changes to take place
    // andi at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    // and at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.rf_waddr_D == 5) begin
      $display("rf_waddr_D is correct.  Expected: %h, Actual: %h", 'h5,DUT.rf_waddr_D); pass();
    end else begin
      $display("rf_waddr_D is incorrect.  Expected: %h, Actual: %h", 'h5,DUT.rf_waddr_D); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00207313; // andi x6, x0, 2
    #1
    // andi at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 0) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.rf_waddr_D == 6) begin
      $display("rf_waddr_D is correct.  Expected: %h, Actual: %h", 'h6,DUT.rf_waddr_D); pass();
    end else begin
      $display("rf_waddr_D is incorrect.  Expected: %h, Actual: %h", 'h6,DUT.rf_waddr_D); fail(); $finish();
    end
    // and at X stage
    $display("%h",DUT.inst_X);
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end
    assert(DUT.imul_resp_rdy_X == 0) begin
      $display("imul_resp_rdy_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_resp_rdy_X); pass();
    end else begin
      $display("imul_resp_rdy_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_resp_rdy_X); fail(); $finish();
    end
    assert(DUT.alu_fn_X == 2) begin
      $display("alu_fn_X is correct.  Expected: %h, Actual: %h", 'h2,DUT.alu_fn_X); pass();
    end else begin
      $display("alu_fn_X is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.alu_fn_X); fail(); $finish();
    end
    assert(DUT.ex_result_sel_X == 1) begin
      $display("imul_resp_rdy_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.ex_result_sel_X); pass();
    end else begin
      $display("imul_resp_rdy_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.ex_result_sel_X); fail(); $finish();
    end

    @(negedge clk);
    // andi at X stage
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end
    assert(DUT.imul_resp_rdy_X == 0) begin
      $display("imul_resp_rdy_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_resp_rdy_X); pass();
    end else begin
      $display("imul_resp_rdy_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_resp_rdy_X); fail(); $finish();
    end
    assert(DUT.alu_fn_X == 2) begin
      $display("alu_fn_X is correct.  Expected: %h, Actual: %h", 'h2,DUT.alu_fn_X); pass();
    end else begin
      $display("alu_fn_X is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.alu_fn_X); fail(); $finish();
    end
    assert(DUT.ex_result_sel_X == 1) begin
      $display("ex_result_sel_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.ex_result_sel_X); pass();
    end else begin
      $display("ex_result_sel_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.ex_result_sel_X); fail(); $finish();
    end
    // and at M stage
    assert(DUT.reg_en_M == 1) begin
      $display("reg_en_M is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_M); pass();
    end else begin
      $display("reg_en_M is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_M); fail(); $finish();
    end
    assert(DUT.wb_result_sel_M == 1) begin
      $display("wb_result_sel_M is correct.  Expected: %h, Actual: %h", 'h1,DUT.wb_result_sel_M); pass();
    end else begin
      $display("wb_result_sel_M is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.wb_result_sel_M); fail(); $finish();
    end

    @(negedge clk);
    // andi at M stage
    assert(DUT.reg_en_M == 1) begin
      $display("reg_en_M is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_M); pass();
    end else begin
      $display("reg_en_M is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_M); fail(); $finish();
    end
    assert(DUT.wb_result_sel_M == 1) begin
      $display("wb_result_sel_M is correct.  Expected: %h, Actual: %h", 'h1,DUT.wb_result_sel_M); pass();
    end else begin
      $display("wb_result_sel_M is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.wb_result_sel_M); fail(); $finish();
    end
    // and at W stage
    assert(DUT.reg_en_W == 1) begin
      $display("reg_en_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_W); pass();
    end else begin
      $display("reg_en_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_W); fail(); $finish();
    end
    assert(DUT.rf_waddr_W == 5) begin
      $display("rf_waddr_W is correct.  Expected: %h, Actual: %h", 'h5,DUT.rf_waddr_W); pass();
    end else begin
      $display("rf_waddr_W is incorrect.  Expected: %h, Actual: %h", 'h5,DUT.rf_waddr_W); fail(); $finish();
    end
    assert(DUT.rf_wen_W == 1) begin
      $display("rf_wen_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.rf_wen_W); pass();
    end else begin
      $display("rf_wen_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.rf_wen_W); fail(); $finish();
    end

    @(negedge clk);
    // andi at W stage
    assert(DUT.reg_en_W == 1) begin
      $display("reg_en_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_W); pass();
    end else begin
      $display("reg_en_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_W); fail(); $finish();
    end
    assert(DUT.rf_waddr_W == 6) begin
      $display("rf_waddr_W is correct.  Expected: %h, Actual: %h", 'h6,DUT.rf_waddr_W); pass();
    end else begin
      $display("rf_waddr_W is incorrect.  Expected: %h, Actual: %h", 'h6,DUT.rf_waddr_W); fail(); $finish();
    end
    assert(DUT.rf_wen_W == 1) begin
      $display("rf_wen_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.rf_wen_W); pass();
    end else begin
      $display("rf_wen_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.rf_wen_W); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #2  MUL has correct stall/unstall signals
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // and at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'h022084b3; // mul x9, x1, x2
    imul_req_rdy_D = 0;
    #1
    // mul at D stage, simulate ! req rdy
    assert(DUT.reg_en_D == 0) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.rf_waddr_D == 9) begin
      $display("rf_waddr_D is correct.  Expected: %h, Actual: %h", 'h9,DUT.rf_waddr_D); pass();
    end else begin
      $display("rf_waddr_D is incorrect.  Expected: %h, Actual: %h", 'h9,DUT.rf_waddr_D); fail(); $finish();
    end
    assert(DUT.ostall_D == 1) begin
      $display("ostall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.ostall_D); pass();
    end else begin
      $display("ostall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.ostall_D); fail(); $finish();
    end
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.stall_F == 1) begin
      $display("stall_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); pass();
    end else begin
      $display("stall_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); fail(); $finish();
    end

    @(negedge clk);
    imul_req_rdy_D = 1;
    #1
    // mul at D stage, simulate req rdy
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 1) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.rf_waddr_D == 9) begin
      $display("rf_waddr_D is correct.  Expected: %h, Actual: %h", 'h9,DUT.rf_waddr_D); pass();
    end else begin
      $display("rf_waddr_D is incorrect.  Expected: %h, Actual: %h", 'h9,DUT.rf_waddr_D); fail(); $finish();
    end
    assert(DUT.ostall_D == 0) begin
      $display("ostall_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.ostall_D); pass();
    end else begin
      $display("ostall_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.ostall_D); fail(); $finish();
    end

    @(negedge clk);
    imul_req_rdy_D = 0;
    imul_resp_val_X = 0;
    imul_resp_rdy_X = 1;
    #1
    // mul at X stage, simulate !resp val
    assert(DUT.reg_en_X == 0) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_X); fail(); $finish();
    end 
    assert(DUT.stall_X == 1) begin
      $display("stall_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_X); pass();
    end else begin
      $display("stall_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_X); fail(); $finish();
    end
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.stall_F == 1) begin
      $display("stall_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); pass();
    end else begin
      $display("stall_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); fail(); $finish();
    end

    @(negedge clk);
    imul_req_rdy_D = 1;
    imul_resp_val_X = 1;
    imul_resp_rdy_X = 1;
    #1
    // mul at X stage, simulate resp val
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end 
    assert(DUT.stall_X == 0) begin
      $display("stall_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.stall_X); pass();
    end else begin
      $display("stall_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.stall_X); fail(); $finish();
    end
    assert(DUT.ex_result_sel_X == 0) begin
      $display("imul_resp_rdy_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.ex_result_sel_X); pass();
    end else begin
      $display("imul_resp_rdy_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.ex_result_sel_X); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #3  BEQ, ADDI has correct signals
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // beq at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'h00108463; // beq x1, x1, 8
    #1
    // beq at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 2) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h2,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00800093; // addi x1, x0, 8
    br_cond_eq_X = 1;
    #1
    // addi at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.squash_D == 1) begin
      $display("squash_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.squash_D); pass();
    end else begin
      $display("squash_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.squash_D); fail(); $finish();
    end
    // beq at X stage
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end
    assert(DUT.pc_sel_F == 2) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h2,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.osquash_X == 1) begin
      $display("osquash_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.osquash_X); pass();
    end else begin
      $display("osquash_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.osquash_X); fail(); $finish();
    end
    br_cond_eq_X = 0; // check alternative alu signal
    #1
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.osquash_X == 0) begin
      $display("osquash_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.osquash_X); pass();
    end else begin
      $display("osquash_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.osquash_X); fail(); $finish();
    end
    assert(DUT.squash_D == 0) begin
      $display("squash_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.squash_D); pass();
    end else begin
      $display("squash_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.squash_D); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #4  JAL has correct signals
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // jal at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'hffdff2ef; // jal x5, -4
    #1
    // jal at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 4) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h4,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h4,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.rf_waddr_D == 5) begin
      $display("rf_waddr_D is correct.  Expected: %h, Actual: %h", 'h5,DUT.rf_waddr_D); pass();
    end else begin
      $display("rf_waddr_D is incorrect.  Expected: %h, Actual: %h", 'h5,DUT.rf_waddr_D); fail(); $finish();
    end
    assert(DUT.pc_sel_F == 1) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.osquash_D == 1) begin
      $display("osquash_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.osquash_D); pass();
    end else begin
      $display("osquash_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.osquash_D); fail(); $finish();
    end
    assert(DUT.squash_F == 1) begin
      $display("squash_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.squash_F); pass();
    end else begin
      $display("squash_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.squash_F); fail(); $finish();
    end
    assert(DUT.imem_respstream_drop == 1) begin
      $display("imem_respstream_drop is correct.  Expected: %h, Actual: %h", 'h1,DUT.imem_respstream_drop); pass();
    end else begin
      $display("imem_respstream_drop is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.imem_respstream_drop); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #5  BEQ, JAL has correct signals(1)
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // beq at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'h00108463; // beq x1, x1, 8
    #1
    // beq at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 2) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h2,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'hffdff2ef; // jal x5, -4
    br_cond_eq_X = 1;
    #1
    // jal at D stage, beq at X stage
    assert(DUT.pc_sel_F == 2) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h2,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.osquash_X == 1) begin
      $display("osquash_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.osquash_X); pass();
    end else begin
      $display("osquash_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.osquash_X); fail(); $finish();
    end
    assert(DUT.squash_D == 1) begin
      $display("squash_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.squash_D); pass();
    end else begin
      $display("squash_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.squash_D); fail(); $finish();
    end
    assert(DUT.pc_redirect_D == 1) begin
      $display("pc_redirect_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.pc_redirect_D); pass();
    end else begin
      $display("pc_redirect_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.pc_redirect_D); fail(); $finish();
    end
    assert(DUT.pc_redirect_X == 1) begin
      $display("pc_redirect_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.pc_redirect_X); pass();
    end else begin
      $display("pc_redirect_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.pc_redirect_X); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #5  BEQ, JAL has correct signals(2)
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // beq at F stage
    assert(DUT.reg_en_F == 1) begin
      $display("reg_en_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); pass();
    end else begin
      $display("reg_en_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_F); fail(); $finish();
    end 
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'h00108463; // beq x1, x1, 8
    #1
    // beq at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 2) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h2,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'hffdff2ef; // jal x5, -4
    br_cond_eq_X = 0; // check alternative alu signal
    #1
    // jal at D stage, beq at X stage
    assert(DUT.pc_redirect_X == 0) begin
      $display("pc_redirect_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_redirect_X); pass();
    end else begin
      $display("pc_redirect_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_redirect_X); fail(); $finish();
    end
    assert(DUT.pc_redirect_D == 1) begin
      $display("pc_redirect_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.pc_redirect_D); pass();
    end else begin
      $display("pc_redirect_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.pc_redirect_D); fail(); $finish();
    end
    assert(DUT.pc_sel_F == 1) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.osquash_D == 1) begin
      $display("osquash_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.osquash_D); pass();
    end else begin
      $display("osquash_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.osquash_D); fail(); $finish();
    end
    assert(DUT.squash_D == 0) begin
      $display("squash_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.squash_D); pass();
    end else begin
      $display("squash_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.squash_D); fail(); $finish();
    end
    assert(DUT.osquash_X == 0) begin
      $display("osquash_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.osquash_X); pass();
    end else begin
      $display("osquash_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.osquash_X); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #6  LW, SW has correct signals
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // lw at F stage 
    @(negedge clk);
    inst_D = 32'h00002383; // lw x7, 0(x0)
    #1
    // lw at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 0) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.rf_waddr_D == 7) begin
      $display("rf_waddr_D is correct.  Expected: %h, Actual: %h", 'h7,DUT.rf_waddr_D); pass();
    end else begin
      $display("rf_waddr_D is incorrect.  Expected: %h, Actual: %h", 'h7,DUT.rf_waddr_D); fail(); $finish();
    end
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.osquash_D == 0) begin
      $display("osquash_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.osquash_D); pass();
    end else begin
      $display("osquash_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.osquash_D); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00702023; // sw x7, 0(x0)
    dmem_reqstream_rdy = 0; // simulate dmem not ready
    #1
    // sw at D stage
    assert(DUT.reg_en_D == 0) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 1) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.stall_F == 1) begin
      $display("stall_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); pass();
    end else begin
      $display("stall_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); fail(); $finish();
    end
    // lw at X stage
    assert(DUT.stall_X == 1) begin
      $display("stall_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_X); pass();
    end else begin
      $display("stall_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_X); fail(); $finish();
    end
    assert(DUT.reg_en_X == 0) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_X); fail(); $finish();
    end
    
    @(negedge clk);
    inst_D = 32'h00702023; // sw x7, 0(x0)
    dmem_reqstream_rdy = 1; // simulate dmem ready
    #1
    // sw at D stage
    assert(DUT.reg_en_D == 0) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 1) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.imm_type_D); fail(); $finish();
    end
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.stall_F == 1) begin
      $display("stall_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); pass();
    end else begin
      $display("stall_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_F); fail(); $finish();
    end
    // lw at X stage
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end
    assert(DUT.alu_fn_X == 0) begin
      $display("alu_fn_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.alu_fn_X); pass();
    end else begin
      $display("alu_fn_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.alu_fn_X); fail(); $finish();
    end
    assert(DUT.dmem_reqstream_val == 1) begin
      $display("dmem_reqstream_val is correct.  Expected: %h, Actual: %h", 'h1,DUT.dmem_reqstream_val); pass();
    end else begin
      $display("dmem_reqstream_val is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.dmem_reqstream_val); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00702023; // sw x7, 0(x0)
    dmem_respstream_val = 0; // simulate dmem ! resp val
    #1
    // sw at D stage
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.val_X == 0) begin
      $display("val_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.val_X); pass();
    end else begin
      $display("val_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.val_X); fail(); $finish();
    end
    // lw at M stage
    assert(DUT.stall_M == 1) begin
      $display("stall_M is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_M); pass();
    end else begin
      $display("stall_M is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_M); fail(); $finish();
    end
    assert(DUT.dmem_respstream_rdy == 0) begin
      $display("dmem_respstream_rdy is correct.  Expected: %h, Actual: %h", 'h0,DUT.dmem_respstream_rdy); pass();
    end else begin
      $display("dmem_respstream_rdy is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.dmem_respstream_rdy); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00702023; // sw x7, 0(x0)
    dmem_respstream_val = 1; // simulate dmem resp val
    #1
    // sw at D stage
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.val_X == 0) begin
      $display("val_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.val_X); pass();
    end else begin
      $display("val_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.val_X); fail(); $finish();
    end
    // lw at M stage
    assert(DUT.dmem_respstream_rdy == 1) begin
      $display("dmem_respstream_rdy is correct.  Expected: %h, Actual: %h", 'h1,DUT.dmem_respstream_rdy); pass();
    end else begin
      $display("dmem_respstream_rdy is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.dmem_respstream_rdy); fail(); $finish();
    end
    assert(DUT.stall_M == 0) begin
      $display("stall_M is correct.  Expected: %h, Actual: %h", 'h0,DUT.stall_M); pass();
    end else begin
      $display("stall_M is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.stall_M); fail(); $finish();
    end
    assert(DUT.wb_result_sel_M == 0) begin
      $display("wb_result_sel_M is correct.  Expected: %h, Actual: %h", 'h0,DUT.wb_result_sel_M); pass();
    end else begin
      $display("wb_result_sel_M is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.wb_result_sel_M); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00702023; // sw x7, 0(x0)
    dmem_respstream_val = 1; // simulate dmem resp val
    #1
    // sw at D stage
    assert(DUT.stall_D == 1) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.val_X == 0) begin
      $display("val_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.val_X); pass();
    end else begin
      $display("val_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.val_X); fail(); $finish();
    end
    assert(DUT.val_M == 0) begin
      $display("val_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.val_M); pass();
    end else begin
      $display("val_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.val_M); fail(); $finish();
    end
    // lw at W stage
    assert(DUT.reg_en_W == 1) begin
      $display("reg_en_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_W); pass();
    end else begin
      $display("reg_en_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_W); fail(); $finish();
    end
    assert(DUT.rf_waddr_W == 7) begin
      $display("rf_waddr_W is correct.  Expected: %h, Actual: %h", 'h7,DUT.rf_waddr_W); pass();
    end else begin
      $display("rf_waddr_W is incorrect.  Expected: %h, Actual: %h", 'h7,DUT.rf_waddr_W); fail(); $finish();
    end
    assert(DUT.rf_wen_W == 1) begin
      $display("rf_wen_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.rf_wen_W); pass();
    end else begin
      $display("rf_wen_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.rf_wen_W); fail(); $finish();
    end

    @(negedge clk);
    inst_D = 32'h00702023; // sw x7, 0(x0)
    #1
    // sw at D stage
    assert(DUT.stall_D == 0) begin
      $display("stall_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.stall_D); pass();
    end else begin
      $display("stall_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.stall_D); fail(); $finish();
    end
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.imm_type_D == 1) begin
      $display("imm_type_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.imm_type_D); pass();
    end else begin
      $display("imm_type_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.imm_type_D); fail(); $finish();
    end

    @(negedge clk);
    // sw at X stage
    dmem_reqstream_rdy = 1;
    #1
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end
    assert(DUT.alu_fn_X == 0) begin
      $display("alu_fn_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.alu_fn_X); pass();
    end else begin
      $display("alu_fn_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.alu_fn_X); fail(); $finish();
    end
    assert(DUT.dmem_reqstream_val == 1) begin
      $display("dmem_reqstream_val is correct.  Expected: %h, Actual: %h", 'h1,DUT.dmem_reqstream_val); pass();
    end else begin
      $display("dmem_reqstream_val is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.dmem_reqstream_val); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #6  NOP has correct signals
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // nop at F stage 
    @(negedge clk);
    inst_D = 32'b0000000_00000_00000_000_00000_0010011; // NOP
    #1
    // nop at D stage
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.imul_req_val_D == 0) begin
      $display("imul_req_val_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); pass();
    end else begin
      $display("imul_req_val_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_req_val_D); fail(); $finish();
    end
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end 

    @(negedge clk);
    // nop at X stage
    assert(DUT.reg_en_X == 1) begin
      $display("reg_en_X is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); pass();
    end else begin
      $display("reg_en_X is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_X); fail(); $finish();
    end
    assert(DUT.dmem_reqstream_val == 0) begin
      $display("dmem_reqstream_val is correct.  Expected: %h, Actual: %h", 'h0,DUT.dmem_reqstream_val); pass();
    end else begin
      $display("dmem_reqstream_val is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.dmem_reqstream_val); fail(); $finish();
    end
    assert(DUT.pc_sel_F == 0) begin
      $display("pc_sel_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); pass();
    end else begin
      $display("pc_sel_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.pc_sel_F); fail(); $finish();
    end
    assert(DUT.imul_resp_rdy_X == 0) begin
      $display("imul_resp_rdy_X is correct.  Expected: %h, Actual: %h", 'h0,DUT.imul_resp_rdy_X); pass();
    end else begin
      $display("imul_resp_rdy_X is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.imul_resp_rdy_X); fail(); $finish();
    end

    @(negedge clk);
    // nop at M stage
    assert(DUT.reg_en_M == 1) begin
      $display("reg_en_M is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_M); pass();
    end else begin
      $display("reg_en_M is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_M); fail(); $finish();
    end
    assert(DUT.dmem_respstream_rdy == 0) begin
      $display("dmem_respstream_rdy is correct.  Expected: %h, Actual: %h", 'h0,DUT.dmem_respstream_rdy); pass();
    end else begin
      $display("dmem_respstream_rdy is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.dmem_respstream_rdy); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #7  Register-register
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // nop at F stage 
    @(negedge clk);
    inst_D = 32'h01ff8fb3;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h41ef0f33;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    br_cond_ltu_X = 1;
    inst_D = 32'h01deeeb3;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h01ce4e33;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h01bdadb3;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h01ad3d33;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h419cdcb3;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h018c5c33;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    br_cond_lt_X = 1;
    inst_D = 32'h017b9bb3;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 0) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #8  Register-immediate
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // nop at F stage 
    @(negedge clk);
    inst_D = 32'hfffb6b13;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'hfffaca93;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h7ffa2a13;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h7ff9b993;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h40595913;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h00595913;
    #1
    assert(DUT.reg_en_D == 0) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'h00591913;
    #1
    assert(DUT.reg_en_D == 0) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    assert(DUT.op2_sel_D == 1) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.op2_sel_D); fail(); $finish();
    end
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'hfffff937;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    @(negedge clk);
    inst_D = 32'h7ffff217;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 

    reg_en_W = 0;
    reset = 1;
    #10
    reg_en_W = 1;
    stats_en_wen_W = 1;

    //--------------------------------------------------------------------
    // Unit Testing #9  Branch
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    // nop at F stage 
    @(negedge clk);
    inst_D = 32'h00419663;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    @(negedge clk);
    reset = 1;
    #10;
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    @(negedge clk);
    inst_D = 32'h0041c663;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    @(negedge clk);
    @(negedge clk);
    reset = 1;
    #10;
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    @(negedge clk);
    inst_D = 32'h0041d663;
    #1
    inst_D = 32'h0041e663;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end
    @(negedge clk); 
    @(negedge clk); 
    reset = 1;
    #10;
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    @(negedge clk);
    inst_D = 32'h0041d663;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    @(negedge clk); 
    @(negedge clk); 
    reset = 1;
    #10;
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    @(negedge clk);
    inst_D = 32'h041f663;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    @(negedge clk);
    @(negedge clk); 
    reset = 1;
    #10;
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 1;
    @(negedge clk);
    @(negedge clk);
    inst_D = 32'h00800567;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end 
    @(negedge clk); 
    @(negedge clk); 

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #10  Imem Resp Not Valid
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    @(negedge clk); 
    reset = 0;
    imem_respstream_val = 0;
    @(negedge clk);
    assert(DUT.ostall_F == 1) begin
      $display("ostall_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.ostall_F); pass();
    end else begin
      $display("ostall_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.ostall_F); fail(); $finish();
    end 
    @(negedge clk);
    @(negedge clk);
    assert(DUT.ostall_F == 1) begin
      $display("ostall_F is correct.  Expected: %h, Actual: %h", 'h1,DUT.ostall_F); pass();
    end else begin
      $display("ostall_F is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.ostall_F); fail(); $finish();
    end 
    @(negedge clk);
    imem_respstream_val = 1;
    #1
    assert(DUT.ostall_F == 0) begin
      $display("ostall_F is correct.  Expected: %h, Actual: %h", 'h0,DUT.ostall_F); pass();
    end else begin
      $display("ostall_F is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.ostall_F); fail(); $finish();
    end 

    reset = 1;
    #10

    //--------------------------------------------------------------------
    // Unit Testing #15  CSRR, CSRW
    //--------------------------------------------------------------------
    // Align test bench with negedge so that it looks better
    imem_reqstream_rdy = 0;
     @(negedge clk); 
    reset = 0;
    imem_reqstream_rdy = 1;
    imem_respstream_val = 1;
    @(negedge clk);
    @(negedge clk);
    inst_D = 32'b1111_1100_0000_00000_010_00001_1110011; // csrr
    mngr2proc_val = 0;
    #1
    assert(DUT.reg_en_D == 0) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.reg_en_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'b1111_1100_0000_00000_010_00001_1110011;
    mngr2proc_val = 1;
    #1
    assert(DUT.reg_en_D == 1) begin
      $display("reg_en_D is correct.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); pass();
    end else begin
      $display("reg_en_D is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.reg_en_D); fail(); $finish();
    end
    assert(DUT.csrr_sel_D == 0) begin
      $display("csrr_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.csrr_sel_D); pass();
    end else begin
      $display("csrr_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.csrr_sel_D); fail(); $finish();
    end
    assert(DUT.op2_sel_D == 2) begin
      $display("op2_sel_D is correct.  Expected: %h, Actual: %h", 'h2,DUT.op2_sel_D); pass();
    end else begin
      $display("op2_sel_D is incorrect.  Expected: %h, Actual: %h", 'h2,DUT.op2_sel_D); fail(); $finish();
    end
    @(negedge clk);
    inst_D = 32'b0111_1100_0000_00001_001_00000_1110011; // csrw
    #1
    assert(DUT.op1_sel_D == 0) begin
      $display("op1_sel_D is correct.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); pass();
    end else begin
      $display("op1_sel_D is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.op1_sel_D); fail(); $finish();
    end
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    // csrr at W, csrw still at D
    @(negedge clk); // csrw at X
    @(negedge clk);
    @(negedge clk); // csrw at W
    proc2mngr_rdy = 0;
    #1
    assert(DUT.ostall_W == 1) begin
      $display("ostall_W is correct.  Expected: %h, Actual: %h", 'h1,DUT.ostall_W); pass();
    end else begin
      $display("ostall_W is incorrect.  Expected: %h, Actual: %h", 'h1,DUT.ostall_W); fail(); $finish();
    end 
    @(negedge clk); // csrw at W
    proc2mngr_rdy = 1;
    #1
    assert(DUT.ostall_W == 0) begin
      $display("ostall_W is correct.  Expected: %h, Actual: %h", 'h0,DUT.ostall_W); pass();
    end else begin
      $display("ostall_W is incorrect.  Expected: %h, Actual: %h", 'h0,DUT.ostall_W); fail(); $finish();
    end 

    #50

    $finish();

  end

endmodule
