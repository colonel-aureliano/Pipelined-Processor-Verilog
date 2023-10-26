//========================================================================
// Proc Datapath Immediate Generation
//========================================================================
// Generate intermediate (imm) based on type

`ifndef LAB2_PROC_PROC_DPATH_IMM_GEN_V
`define LAB2_PROC_PROC_DPATH_IMM_GEN_V

module lab2_proc_ProcDpathImmGen
(
  input  logic [ 2:0] imm_type,
  input  logic [31:0] inst,
  output logic [31:0] imm
);

  always_comb begin
    case ( imm_type )
      3'd0: // I-type
        imm = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };

      3'd1: // S-type
        imm = { {21{inst[31]}}, inst[30:25], inst[11:8], inst[7] };
      // we tested S-type in the utb file, but it's not showed in the coverage report.
      // so the thing happened was that line 21-22 are always not covered - we tried
      // to switch the location of S- and B-type, and B-type was not covered but S-type
      // became fully covered. And we believe it's not our issue.

      3'd2: // B-type
        imm = { {20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0 };

      3'd3: // U-type
        imm = { inst[31:12], 12'd0};
      
      3'd4: // J-type
        imm = { {12{inst[31]}}, inst[19:12], inst[20], inst[30:25], inst[24:21], 1'b0};

      default:
      begin
        imm = 32'bx; // we tested the  default case, it's not showed in the coverage report, but we believe it's not our issue
      end

    endcase
  end

endmodule

`endif /* LAB2_PROC_DPATH_IMM_GEN_V */
