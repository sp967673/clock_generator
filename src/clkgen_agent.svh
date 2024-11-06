
`ifndef __CLKGEN_AGENT_SVH__
`define __CLKGEN_AGENT_SVH__

class clkgen_agent extends uvm_agent;

    clkgen_driver  drv;
    clkgen_monitor mon;
    clkgen_config  cfg;

    virtual clkgen_vif vif;

    `uvm_component_utils(clkgen_agent)

  function new(string name="clkgen_agent", uvm_component parent);
      super.new(name, parent);
  endfunction: new

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass: clkgen_agent

`endif //__CLKGEN_AGENT_SVH__
