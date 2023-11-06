`timescale 1ns / 1ps

module mixcolumn(clk,data_in,data_out);
input clk;
input [127:0] data_in;
output [127:0] data_out;

assign data_out[127:120]= mixcolumn32 (data_in[127:120],data_in[119:112],data_in[111:104],data_in[103:96]);
assign data_out[119:112]= mixcolumn32 (data_in[119:112],data_in[111:104],data_in[103:96],data_in[127:120]);
assign data_out[111:104]= mixcolumn32 (data_in[111:104],data_in[103:96],data_in[127:120],data_in[119:112]);
assign data_out[103:96]= mixcolumn32 (data_in[103:96],data_in[127:120],data_in[119:112],data_in[111:104]);

assign data_out[95:88]= mixcolumn32 (data_in[95:88],data_in[87:80],data_in[79:72],data_in[71:64]);
assign data_out[87:80]= mixcolumn32 (data_in[87:80],data_in[79:72],data_in[71:64],data_in[95:88]);
assign data_out[79:72]= mixcolumn32 (data_in[79:72],data_in[71:64],data_in[95:88],data_in[87:80]);
assign data_out[71:64]= mixcolumn32 (data_in[71:64],data_in[95:88],data_in[87:80],data_in[79:72]);

assign data_out[63:56]= mixcolumn32 (data_in[63:56],data_in[55:48],data_in[47:40],data_in[39:32]);
assign data_out[55:48]= mixcolumn32 (data_in[55:48],data_in[47:40],data_in[39:32],data_in[63:56]);
assign data_out[47:40]= mixcolumn32 (data_in[47:40],data_in[39:32],data_in[63:56],data_in[55:48]);
assign data_out[39:32]= mixcolumn32 (data_in[39:32],data_in[63:56],data_in[55:48],data_in[47:40]);

assign data_out[31:24]= mixcolumn32 (data_in[31:24],data_in[23:16],data_in[15:8],data_in[7:0]);
assign data_out[23:16]= mixcolumn32 (data_in[23:16],data_in[15:8],data_in[7:0],data_in[31:24]);
assign data_out[15:8]= mixcolumn32 (data_in[15:8],data_in[7:0],data_in[31:24],data_in[23:16]);
assign data_out[7:0]= mixcolumn32 (data_in[7:0],data_in[31:24],data_in[23:16],data_in[15:8]);

function [7:0] mixcolumn32;
input [7:0] i1,i2,i3,i4;
begin
mixcolumn32[7]=i1[6] ^ i2[6] ^ i2[7] ^ i3[7] ^ i4[7];
mixcolumn32[6]=i1[5] ^ i2[5] ^ i2[6] ^ i3[6] ^ i4[6];
mixcolumn32[5]=i1[4] ^ i2[4] ^ i2[5] ^ i3[5] ^ i4[5];
mixcolumn32[4]=i1[3] ^ i1[7] ^ i2[3] ^ i2[4] ^ i2[7] ^ i3[4] ^ i4[4];
mixcolumn32[3]=i1[2] ^ i1[7] ^ i2[2] ^ i2[3] ^ i2[7] ^ i3[3] ^ i4[3];
mixcolumn32[2]=i1[1] ^ i2[1] ^ i2[2] ^ i3[2] ^ i4[2];
mixcolumn32[1]=i1[0] ^ i1[7] ^ i2[0] ^ i2[1] ^ i2[7] ^ i3[1] ^ i4[1];
mixcolumn32[0]=i1[7] ^ i2[7] ^ i2[0] ^ i3[0] ^ i4[0];
end
endfunction
endmodule