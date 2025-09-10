
TEST_NAME="Uvm_param_vif_config_db/sim"

SRC_FILES="\
    +incdir+../sfr_agent \
    ../sfr_agent/sfr_agent_pkg.sv \
    ../sfr_agent/sfr_master_bfm.sv \
    ../sfr_agent/sfr_monitor_bfm.sv \
    ../tb/tb_params_pkg.sv \
    +incdir+../sfr_test_pkg \
    ../sfr_test_pkg/sfr_test_pkg.sv \
    ../tb/hdl_top.sv \
    ../tb/hvl_top.sv \
    ../rtl/sfr_dut.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS="+UVM_TESTNAME=sfr_test"
