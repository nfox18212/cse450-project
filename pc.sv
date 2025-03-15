`timescale 1ns/1ps

/*Summary of module
	module: ProgramCounter
    purpose: Increments the program counter based on the instruction type. 
    			If R-type instruction, pc + 2. 
                If I-type branch and branch taken, pc + (sign_extend(branch_offset) << 1). 
                If J-type instruction, pc[15:12] + (instr[11:0] << 1).
    inputs:	
    		clock 		- Processor clock
            pc_current 	- Previous instruction address
            branchOff	- Sign-extended and left shifted 1 bit branch offset
            flag_branch	- Branch control flag. Needs to be AND with aluZero to determine whether or not to branch. 
            aluZero 	- ALU Zero output. Needs to be AND with flag_branch to determine whether or not to branch.
            jumpAddr	- Jump address after shifting lower 12 bits by 1 bit and higher 4 bits set by pc + 2.
            flag_jump	- Jump control flag. Determines whether or not to use calculated jump address.
            
    outputs:
    		pc_next - Address for next instruction. Passed to the instruction memory module. 
*/
module ProgramCounter(
  input logic clock,				    // input clock 
  input logic [15:0] pc_current,	    // previous pc, needs to be incremented by 2
  input logic signed [15:0] branchOff,	// sign-extended and left shifted 1 bit branch offset
  input logic flag_branch,			    // branch flag
  input logic aluZero,				    // zero output from ALU
  input logic [15:0] jumpAddr,		    // fully calculated jump address
  input logic flag_jump, 			    // jump flag
  output logic [15:0] pc_next		    // next address to send to the instruction memory
);
  
  always @(posedge clock) begin
    // Increment pc to get next instruction address.
    logic [15:0] nextAddr;
    nextAddr = pc_current + 2;
    
    // Calculate the full branch address from the offset.
    logic signed [15:0] branchAddr;
    branchAddr = nextAddr + branchOff;
    
    // Branch instruction MUX logic. If 1, select branchAddr. If 0, select pc + 2.
    logic branchMux; 
    branchMux = flag_branch & aluZero;
    nextAddr = (branchMux) ? branchAddr : nextAddr;
    
    // Jump instruction MUX logic. If 1, select jumpAddr. If 0, select result from branch MUX.
    nextAddr = (flag_jump) ? jumpAddr : nextAddr;
    
    // Update the program counter output
    pc_next  = nextAddr;
  end
  
endmodule