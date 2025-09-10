
TEST_NAME="mem_example/sim"

SRC_FILES="\
    +incdir+../dut \
    ../dut/*.v \
    ../dut/*.sv \
    +incdir+../agents/ahb_agent \
    +incdir+../utils \
    ../agents/ahb_agent/ahb_agent_pkg.sv \
    +incdir+../register_model \
    ../register_model/mem_ss_reg_pkg.sv \
    ../agents/ahb_agent/ahb_if.sv \
    ../agents/ahb_agent/ahb_monitor_bfm.sv \
    ../agents/ahb_agent/ahb_driver_bfm.sv \
    +incdir+../env \
    ../env/mem_ss_env_pkg.sv \
    +incdir+../sequences \
    ../sequences/mem_ss_seq_lib_pkg.sv \
    +incdir+../test \
    ../test/mem_ss_test_lib_pkg.sv \
    +incdir+../dut \
    ../tb/hvl_top.sv \
    +incdir+../dut \
    ../tb/hdl_top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""

# Arguments passed to simulation binary
SIM_ARGS=""
