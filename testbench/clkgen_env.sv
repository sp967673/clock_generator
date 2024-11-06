
`ifndef __CLKGEN_ENV_SV__
`define __CLKGEN_ENV_SV__

`include "clkgen_env.svh"

function void clkgen_env::build_phase(uvm_phase phase);
    super.build_phase(phase);

    cfg  = clkgen_pkg::clkgen_config::type_id::create("cfg", this);
    cfg.CLK_FREQ_MHZ   = 100;
    cfg.CLK_DUTY_CYCLE = 50;
    cfg.CLK_JITTER_MAX = 0;
    cfg.CLK_JITTER_MIN = 0;
    cfg.CLK_START_TIME = 10;
    cfg.randomize();

    magt = clkgen_pkg::clkgen_agent::type_id::create("magt", this);
    sagt = clkgen_pkg::clkgen_agent::type_id::create("sagt", this);

    set_config_int("sagt", "is_active", UVM_PASSIVE);

    uvm_config_db#(clkgen_pkg::clkgen_config)::set(this, "*magt", "cfg", cfg);
    uvm_config_db#(clkgen_pkg::clkgen_config)::set(this, "*sagt", "cfg", cfg);

endfunction: build_phase

function void clkgen_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction: connect_phase

`endif //__CLKGEN_ENV_SV__
