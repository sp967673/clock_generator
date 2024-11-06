
`ifndef __CLKGEN_DRIVER_SVH__
`define __CLKGEN_DRIVER_SVH__

class clkgen_driver extends uvm_driver;

  `uvm_component_utils(clkgen_driver)
  
  clkgen_config cfg;

  virtual clkgen_vif vif;
  
  function new(string name="clkgen_driver", uvm_component parent);
    super.new(name, parent);
  endfunction: new
  
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task drive_clk(const ref clkgen_config cfg);
  
endclass: clkgen_driver

`endif //__CLKGEN_DRIVER_SVH__
