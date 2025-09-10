
TEST_NAME="use_models_pipelined_get_put/pipelined_get_put"

SRC_FILES="\
    ../mbus_slave/mbus_types_pkg.sv \
    +incdir+./mbus_pipelined_agent \
    ./mbus_pipelined_agent/mbus_pipelined_agent_pkg.sv \
    top_tb.sv \
    ../mbus_slave/mbus_slave.sv \
    ./mbus_pipelined_agent/mbus_pipelined_driver_bfm.sv \
    top_hdl.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS=""
