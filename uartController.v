`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Usask Research
// Engineer: Will Topping
// 
// Create Date:    14:57:37 03/27/2016 
// Design Name: 
// Module Name:    uartController 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uartController(
    input clk,rst,rx_pin,
		output tx_pin,tx_start,rx_recieved,
    input [7:0] tx_input,
    output [7:0] rx_output
    );

	 reg [7:0] rx_output_reg;
	 wire rx_recieving,tx_transmitting,recv_error;

	 uart uart_phy(
    .clk(clk), // The master clock for this module
    .rst(rst), // Synchronous reset.
    .rx(rx_pin), // Incoming serial line
    .tx(tx_pin), // Outgoing serial line
    .transmit(tx_start), // Signal to transmit
    .tx_byte(tx_input), // Byte to transmit
    .received(rx_recieved), // Indicated that a byte has been received.
    .rx_byte(rx_output), // Byte received
    .is_receiving(rx_recieving), // Low when receive line is idle.
    .is_transmitting(tx_transmitting), // Low when transmit line is idle.
    .recv_error(recv_error) // Indicates error in receiving packet.
    );

	 //assign rx_output=rx_output_reg;
	 
	 always @(posedge clk)
	 begin
		rx_output_reg <= tx_input;
	 end
	 


endmodule
