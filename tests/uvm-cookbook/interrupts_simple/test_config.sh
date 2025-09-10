
TEST_NAME="interrupts_simple/simple"

SRC_FILES="\
    +incdir+../utils/interrupt \
    ../utils/interrupt/interrupt_pkg.sv \
    ../utils/interrupt/interrupt_if.sv \
    ../bidirect_bus_agent_pkg.sv \
    top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS="+define+UVM_NO_DPI"
SIM_ARGS=""
