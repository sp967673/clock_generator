
`ifndef __CLKGEN_TEST_SV__
`define __CLKGEN_TEST_SV__

`include "clkgen_test.svh"

function void clkgen_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = clkgen_env::type_id::create("env", this);

endfunction: build_phase

task clkgen_test::run_phase(uvm_phase phase);
    super.run_phase(phase);

    phase.raise_objection(this);
    phase.phase_done.set_drain_time(this, 10us);
    phase.drop_objection(this);
endtask: run_phase

`endif //__CLKGEN_TEST_SV__
