
`ifndef __CLKGEN_ENV_SVH__
`define __CLKGEN_ENV_SVH__

class clkgen_env extends uvm_env;

    `uvm_component_utils(clkgen_env)

    clkgen_pkg::clkgen_config cfg;
    clkgen_pkg::clkgen_agent  magt;
    clkgen_pkg::clkgen_agent  sagt;

    function new(string name="clkgen_env", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass: clkgen_env

`endif //__CLKGEN_ENV_SVH__
