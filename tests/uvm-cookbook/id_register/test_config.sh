
TEST_NAME="id_register"

SRC_FILES="\
    +incdir+apb_agent \
    apb_agent/apb_agent_pkg.sv \
    apb_agent/apb_driver_bfm.sv \
    apb_agent/apb_monitor_bfm.sv \
    reg_dut.sv \
    regmodel_pkg.sv \
    uvm_tb_pkg.sv \
    hvl_top.sv \
    hdl_top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS=""
