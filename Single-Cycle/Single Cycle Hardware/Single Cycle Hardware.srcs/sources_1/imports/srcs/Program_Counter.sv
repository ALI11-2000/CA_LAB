module Program_Counter (
    input [31:0] ALU_out,
    input br_taken, clk, rst, hard_write,
    output reg [31:0] PC, PC_next
);
    always @(posedge clk ) begin
        if(rst || hard_write)
            PC <= 0;
        else 
            PC <= br_taken ? ALU_out : PC + 4;
    end
    
    always@(*) begin
        PC_next <= br_taken ? ALU_out : PC + 4;
    end
    
endmodule