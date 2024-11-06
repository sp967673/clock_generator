
`ifndef __CLKGEN_TEST_SVH__
`define __CLKGEN_TEST_SVH__

class clkgen_test extends uvm_test;

    clkgen_env env;

    `uvm_component_utils(clkgen_test)

    function new(string name="clkgen_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);

endclass: clkgen_test

`endif //__CLKGEN_TEST_SVH__
