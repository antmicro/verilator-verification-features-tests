
TEST_NAME="Uvm_vif_config_db/sim"

SRC_FILES="\
    +incdir+../sfr_agent \
    ../sfr_agent/sfr_agent_pkg.sv \
    ../sfr_agent/sfr_if.sv \
    +incdir+../sfr_test_pkg \
    ../sfr_test_pkg/sfr_test_pkg.sv \
    ../tb/*.sv \
    ../rtl/sfr_dut.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS="+define+UVM_NO_DPI"
SIM_ARGS="+UVM_TESTNAME=sfr_test"
