
TEST_NAME="use_models_pipelined_item_done/pipelined_item_done"

SRC_FILES="\
    ../mbus_slave/mbus_types_pkg.sv \
    ../mbus_slave/mbus_slave.sv \
    +incdir+./mbus_pipelined_agent \
    ./mbus_pipelined_agent/mbus_pipelined_agent_pkg.sv \
    top_tb.sv \
    ./mbus_pipelined_agent/mbus_pipelined_driver_bfm.sv \
    top_hdl.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS=""
