
`ifndef __CLKGEN_AGENT_SV__
`define __CLKGEN_AGENT_SV__

`include "clkgen_agent.svh"

function void clkgen_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db #(clkgen_config)::get(this, "", "cfg", cfg))
        `uvm_fatal("NO_CFG", {"The configuration must be set for: ",get_full_name(), ".cfg"})
    else begin
        uvm_config_db#(clkgen_config)::set(this, "drv", "cfg", cfg);
        uvm_config_db#(clkgen_config)::set(this, "mon", "cfg", cfg);
    end

    if (!uvm_config_db #(virtual clkgen_vif)::get(this, "", "vif", vif))
        `uvm_fatal("NO_VIF", {"The virtual interface must be set for: ",get_full_name(), ".vif"})
    else begin
        uvm_config_db#(virtual clkgen_vif)::set(this, "drv", "vif", vif);
        uvm_config_db#(virtual clkgen_vif)::set(this, "mon", "vif", vif);
    end

    if (get_is_active() == UVM_ACTIVE) begin
        drv = clkgen_driver::type_id::create("drv", this);
    end

    mon = clkgen_monitor::type_id::create("mon", this);

endfunction: build_phase

function void clkgen_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction: connect_phase

`endif //__CLKGEN_AGENT_SV__
