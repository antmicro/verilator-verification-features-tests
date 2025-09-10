
TEST_NAME="slave_agent_multi_seq_item"

SRC_FILES="\
    ./agents/apb_slave_agent/apb_if.sv \
    +incdir+./agents/apb_slave_agent \
    ./agents/apb_slave_agent/apb_slave_agent_pkg.sv \
    ./agents/apb_slave_agent/apb_slave_monitor_bfm.sv \
    ./agents/apb_slave_agent/apb_slave_driver_bfm.sv \
    ./rtl/apb3_wlm_host.sv \
    +incdir+./tb \
    ./tb/env_pkg.sv \
    ./tb/hdl_top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS=""
