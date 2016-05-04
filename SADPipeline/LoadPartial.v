`timescale 1ns / 1ps
module LoadPartial(frmMEM, out, Ctrl, unSigned);

input Ctrl, unSigned;
input [31:0] frmMEM;
output reg [31:0] out;

always @(*)
begin
    
    //Ctrl == 1 then Half-Word Load else Byte Load
    if (Ctrl)
    begin
        //unSigned == 1 then ZE
        if (unSigned)
        begin
            out = {16'b0000000000000000,frmMEM[15:0]}; 
        end
        else if(frmMEM[15] == 1)
        begin
            out = {16'b1111111111111111,frmMEM[15:0]};
        end
        else
        begin
            out = {16'b0000000000000000,frmMEM[15:0]};
        end
    end
    else
    begin
        //unSigned == 1 then ZE
        if (unSigned)
        begin
            out = {24'b000000000000000000000000,frmMEM[7:0]};
        end
        else if(frmMEM[7] == 1)
        begin
            out = {24'b111111111111111111111111,frmMEM[7:0]};
        end
        else
        begin
            out = {24'b000000000000000000000000,frmMEM[7:0]};
        end
    end
    
end
endmodule