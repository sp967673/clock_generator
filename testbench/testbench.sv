
`include "clkgen_vif.sv"
`include "clkgen_pkg.sv"
`include "clkgen_env.sv"

module testbench;

   import uvm_pkg::*;
   import clkgen_pkg::*;

   `include "clkgen_test.sv"

   wire clk;

   clkgen_vif m_vif();
   clkgen_vif s_vif();

   assign s_vif.clko = m_vif.clko;

   initial begin
       uvm_config_db#(virtual clkgen_vif)::set(uvm_root::get(), "*env.magt*", "vif", m_vif);
       uvm_config_db#(virtual clkgen_vif)::set(uvm_root::get(), "*env.sagt*", "vif", s_vif);
   end

   initial begin
       run_test();
   end

endmodule: testbench
