
`ifndef __CLKGEN_VIF_SV__
`define __CLKGEN_VIF_SV__

interface clkgen_vif;
    logic clko;

    modport master (
        output clko
    );

    modport slave (
        input  clko
    );

endinterface: clkgen_vif

`endif //__CLKGEN_VIF_SV__
