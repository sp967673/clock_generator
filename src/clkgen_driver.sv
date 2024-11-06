
`ifndef __CLKGEN_DRIVER_SV__
`define __CLKGEN_DRIVER_SV__

`include "clkgen_driver.svh"

function void clkgen_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if (!uvm_config_db #(clkgen_config)::get(this, "", "cfg", cfg))
      `uvm_fatal("NO_CFG", {"The configuration must be set for: ",get_full_name(), ".cfg"})

  if (!uvm_config_db #(virtual clkgen_vif)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", {"The virtual interface must be set for: ",get_full_name(), ".vif"})

endfunction: build_phase

task clkgen_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);

    fork
        drive_clk(cfg);
    join
endtask: run_phase

task clkgen_driver::drive_clk(const ref clkgen_config cfg);
    int  CLK_FREQ = cfg.get_clk_freq();
    int  CLK_DUTY = cfg.get_clk_duty();
    int  CLK_JITTER_VAL = cfg.get_clk_jitter();
    int  CLK_START = cfg.get_clk_start();

    real period, jitter, high_time, low_time, high_time_jitter, low_time_jitter;

    period = 1.0 / CLK_FREQ * 1000;
    jitter = (CLK_JITTER_VAL / 100.0) * period;
    high_time = period * (CLK_DUTY / 100.0);
    low_time = period - high_time;

    high_time_jitter = high_time + $urandom_range(-jitter, jitter);
    low_time_jitter = low_time + $urandom_range(-jitter, jitter);

    #(CLK_START);

    forever begin
        vif.clko = 1;
        #(high_time_jitter);
        vif.clko = 0;
        #(low_time_jitter);
    end
endtask: drive_clk

`endif //__CLKGEN_DRIVER_SV__
