`timescale 1ns / 1ps
module StorePartial(rt, frmMEM, toMEM, Ctrl, Address);

input Ctrl;
input [31:0] rt, frmMEM, Address;
output reg [31:0] toMEM;
reg halfPlace;
reg [1:0] bytePlace;
always @(*)
begin
    
	 bytePlace = Address[1:0];
	 halfPlace = Address[0];
    //Ctrl == 1 then Half-Word Store else Byte Store
    if(Ctrl)
	 begin
        case(halfPlace)
		  32'd0:toMEM = {frmMEM[31:16], rt[15:0]};
		  32'd1:toMEM = {rt[15:0], frmMEM[15:0]};
		  default:toMEM = 0;
		  endcase
    end
    else
    begin
	 case(bytePlace)
		  32'd0:toMEM = {frmMEM[31:8], rt[7:0]};
		  32'd1:toMEM = {frmMEM[31:16],rt[7:0], frmMEM[7:0]};
		  32'd2:toMEM = {frmMEM[31:24],rt[7:0], frmMEM[15:0]};
		  32'd3:toMEM = {rt[7:0], frmMEM[24:0]};
		  default:toMEM = 0;
		  endcase
    end
    

end

endmodule