
`ifndef __CLKGEN_MONITOR_SVH__
`define __CLKGEN_MONITOR_SVH__

class clkgen_monitor extends uvm_monitor;
    
    `uvm_component_utils(clkgen_monitor)

    clkgen_config cfg;
    virtual interface clkgen_vif vif;

    function new(string name="clkgen_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    extern task check_clock(const ref clkgen_config cfg);

endclass: clkgen_monitor

`endif //__CLKGEN_MONITOR_SVH__
