//## This is the package of clock generator. This file includes all the files that clock generator
//## needs to be used for integrating.

`ifndef __CLKGEN_PKG_SV__
`define __CLKGEN_PKG_SV__

`timescale 1ns / 1ps

package clkgen_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  `include "clkgen_defines.sv"
  `include "clkgen_config.sv"
  
  `include "clkgen_driver.sv"
  `include "clkgen_monitor.sv"
  `include "clkgen_agent.sv"

endpackage: clkgen_pkg

`endif //__CLKGEN_PKG_SV__
