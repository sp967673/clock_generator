
`ifndef __CLKGEN_MONITOR_SV__
`define __CLKGEN_MONITOR_SV__

`include "clkgen_monitor.svh"

function void clkgen_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if (!uvm_config_db #(clkgen_config)::get(this, "", "cfg", cfg))
      `uvm_fatal("NO_CFG", {"The configuration must be set for: ",get_full_name(), ".cfg"})

  if (!uvm_config_db #(virtual clkgen_vif)::get(this, "", "vif", vif))
      `uvm_fatal("NO_VIF", {"The virtual interface must be set for: ",get_full_name(), ".vif"})

endfunction: build_phase

task clkgen_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);

    fork
        check_clock(cfg);
    join
endtask: run_phase

task clkgen_monitor::check_clock(const ref clkgen_config cfg);
    int  CLK_FREQ   = cfg.get_clk_freq();
    int  CLK_DUTY   = cfg.get_clk_duty();
    real CLK_START  = cfg.get_clk_start();
    real CLK_JITTER = cfg.get_clk_jitter();
    real freq, duty, jitter;
    real period, last_edge, high_time_s, high_time_e;
    real current_edge, high_time;

    forever begin
        @(posedge vif.clko);

        current_edge = $realtime;
        last_edge = 0;
        if (last_edge > 0) begin
            period = current_edge - last_edge;
            freq = 1.0 / period * 1000;

            if (int'(freq) != CLK_FREQ) begin
                `uvm_error(get_type_name(), $sformatf("The predicted clock frequency %0f is not as expected !!!", freq))
            end

            jitter = period - (1.0 / freq);
            high_time_s = $realtime;
        end

        @(negedge vif.clko);
        if (last_edge > 0) begin
            high_time_e = $realtime;
            
            high_time = high_time_e - high_time_s;
            duty = (high_time /period) * 100.0;

            if (int'(duty) != CLK_DUTY)
                `uvm_error(get_type_name(), $sformatf("The predicted clock duty %0f is not as expected !!!", duty))
        end

        if ((jitter < CLK_JITTER) || (jitter > CLK_JITTER)) begin
            `uvm_error(get_type_name(), $sformatf("Clock jitter %0f is out of expected range !!!", jitter))
        end

        last_edge = current_edge;
    end
endtask: check_clock

`endif //__CLKGEN_MONITOR_SV__
