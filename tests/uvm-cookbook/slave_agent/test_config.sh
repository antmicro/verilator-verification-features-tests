
TEST_NAME="slave_agent"

SRC_FILES="\
    +incdir+./agents/apb_slave_agent \
    ./agents/apb_slave_agent/apb_slave_agent_pkg.sv \
    ./agents/apb_slave_agent/apb_if.sv \
    ./agents/apb_slave_agent/apb_slave_driver_bfm.sv \
    ./agents/apb_slave_agent/apb_slave_monitor_bfm.sv \
    ./rtl/apb3_wlm_host.sv \
    +incdir+./tb \
    ./tb/env_pkg.sv \
    ./tb/hdl_top.sv \
    ./tb/hvl_top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS="--timescale 1ns/1ns"
SIM_ARGS=""
