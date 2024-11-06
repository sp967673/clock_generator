
`ifndef __CLKGEN_CONFIG_SV__
`define __CLKGEN_CONFIG_SV__

class clkgen_config extends uvm_sequence_item;

    // Base clock frequency in MHz
    int  CLK_FREQ_MHZ   = 100;

    // Duty cycle percentage (0-100%)
	int  CLK_DUTY_CYCLE = 50;

    // The clock jitter is ??% of clock period
    int  CLK_JITTER_MAX = 5;
	int  CLK_JITTER_MIN = 1;
	
    // start time delay in time units
	int  CLK_START_TIME = 0;
	
	protected rand int CLK_FREQ;
	protected rand int CLK_DUTY;
	protected rand int CLK_JITTER_VAL;
	protected rand int CLK_START;
	
	constraint c_jitter {
	  CLK_JITTER_VAL inside {[CLK_JITTER_MIN:CLK_JITTER_MAX]};
	}
	
	constraint c_freq {
	  CLK_FREQ == CLK_FREQ_MHZ;
	}
	
	constraint c_duty {
	  CLK_DUTY == CLK_DUTY_CYCLE;
	}
	
	constraint c_time {
      CLK_START == CLK_START_TIME;
	}
	
	`uvm_object_utils_begin(clkgen_config)
	  `uvm_field_int (CLK_FREQ_MHZ,    UVM_ALL_ON)
	  `uvm_field_int (CLK_DUTY_CYCLE,  UVM_ALL_ON)
	  `uvm_field_int (CLK_JITTER_MAX,  UVM_ALL_ON)
	  `uvm_field_int (CLK_JITTER_MIN,  UVM_ALL_ON)
	  `uvm_field_int (CLK_START_TIME,  UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name="clkgen_config");
	    super.new(name);
	endfunction: new
	
	function int get_clk_freq();
	  return CLK_FREQ;
	endfunction: get_clk_freq
	
	function time get_clk_duty();
	  return CLK_DUTY;
	endfunction: get_clk_duty
	
	function time get_clk_jitter();
	  return CLK_JITTER_VAL;
	endfunction: get_clk_jitter

    function time get_clk_start();
      return CLK_START;
    endfunction: get_clk_start

endclass: clkgen_config

`endif //__CLKGEN_CONFIG_SV__
