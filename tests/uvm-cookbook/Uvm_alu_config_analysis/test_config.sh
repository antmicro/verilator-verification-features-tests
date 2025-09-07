
TEST_NAME="Uvm_alu_config_analysis/sim"

SRC_FILES="\
    +incdir+../agent \
    ../agent/alu_agent_pkg.sv \
    ../agent/alu_monitor_bfm.sv \
    ../agent/alu_driver_bfm.sv \
    ../alu/*.sv \
    +incdir+../uvm_tb \
    ../uvm_tb/alu_tb_pkg.sv \
    ../tb/*.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS="+define+UVM_NO_DPI"
SIM_ARGS="+UVM_TESTNAME=test_all_parallel"
