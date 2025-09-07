
TEST_NAME="interrupts_parallel_processing/parallel_processing"

SRC_FILES="\
    +incdir+../utils/interrupt \
    ../utils/interrupt/interrupt_pkg.sv \
    ../utils/interrupt/interrupt_if.sv \
    dsp_chain.sv \
    dsp_con_pkg.sv \
    dsp_con_driver_bfm.sv \
    top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS=""
