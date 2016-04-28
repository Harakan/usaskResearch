`timescale 1ns / 1ps
`define LOOPBACK
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:25 04/01/2016 
// Design Name: 
// Module Name:    uart_top 
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

	 //IDC starts at pin numbering 7-20 on the header 
	 // -pins 21 and 22 are ground
	 // -pins 1-6 (pi) are 5V and I2C signals (unused, and should not be connected)
	 // -pins 1-6 on the Hanyang board are also connected to the LEDS
	 // --- This creates a dual driver scenario and those IDC pins should be left unconnected.
	 // --- or routed as to be read by the pi

 module uart_top(
	 output [5:0] LEDS,
	 input CLK_0, CLK_1,
	 input IDC13,IDC12,IDC11,IDC10,IDC9,IDC8,IDC7,IDC6,IDC5,IDC4,IDC2,IDC1,IDC0,
	 output IDC3,
	 output [16:0] SMA_N,SMA_P
	 );

	 // Note: The tx and rx need to be reversed compared to the raspberry pi
	 wire tx_pin;
	 wire rx_pin = IDC1; //raspberry pin #8  (tx) - IDC pin #8
	 assign IDC3 = tx_pin; //raspberry pin #10 (rx) - IDC pin #10

	 wire test_pin0 = IDC4; //raspberry pin #11 (GPIO #0)
	 wire test_pin1 = IDC5; //raspberry pin #12 (GPIO #1)

	 `ifdef LOOPBACK
		 assign tx_pin = rx_pin; //Loopback
	 `else
		 uartController uartControls(
			 .clk(CLK_0),
			 .rst(test_pin0),
			 .rx_pin(rx_pin),
			 .tx_pin(tx_pin)
		 );
	 `endif

	 assign LEDS[0] = test_pin0;
	 assign LEDS[1] = test_pin1;
	 assign LEDS[2] = 0;
	 assign LEDS[3] = 1;
	 assign LEDS[4] = tx_pin;
	 assign LEDS[5] = rx_pin;

	 /*
	 reg [31:0] led_counter;

	 always @(posedge CLK_0)
	 begin
		 led_counter <= led_counter + 1;
	 end

	 assign LEDS[5] = led_counter[10];
	 */


endmodule
