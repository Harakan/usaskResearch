`timescale 10ns / 10ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:10:49 03/27/2016
// Design Name:   uartController
// Module Name:   /home/red/Projects/fpga_workdir/Research/uartControllerTest.v
// Project Name:  Research
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uartController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uartControllerTest;

	// Inputs
	reg clk;
	reg [7:0] tx_input;

	// Outputs
	wire [7:0] rx_output;

	// Instantiate the Unit Under Test (UUT)
	uartController uut (
		.clk(clk), 
		.tx_input(tx_input), 
		.rx_output(rx_output)
	);

/*
	initial begin //clk
		clk=1'b0;
		#10 //wait 100ns for global reset, just being nice :)
		forever #1 clk = ~clk; //100MHz with timescale set at 10ns
	end
	*/
	always #1 clk=~clk;
	
	initial begin
		// Initialize Inputs
		tx_input = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
	end

	assert property (
		@(posedge clk)
			tx_input == #1 rx_output;
	)
	
	`define true 1

  property p_pipe;
    logic v;
    @(posedge clk) (`true,v=DataIn) ##5 (DataOut === v);
  endproperty
		

	sequence tx_rx();
		(1) |-> tx_input = 8'hFF
		##1 tx_input=8'h0;
	endsequence
	
	/*
	sequence pipe_1;
		logic [7:0]tmp;
		(1,tmp=tx_input) ##1 (tmp==rx_output,$display("Checked Pipe");
	endsequence
	
	property pipe_1_prop;
		@(posedge clk)
			1 |-> pipe_1 //Always happening
	end
	
	assert pipe_1;
	*/
	
	
      
endmodule

