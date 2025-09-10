
TEST_NAME="test_init"

SRC_FILES="\
    agent_a_pkg.sv \
    agent_b_pkg.sv \
    agent_c_pkg.sv \
    env_1_pkg.sv \
    env_2_pkg.sv \
    env_top_pkg.sv \
    top_vseq_pkg.sv \
    top_tb.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS="\
    +define+UVM_REPORT_DISABLE_FILE_LINE \
    +define+SVA_ON \
    +define+UVM_NO_DPI"
SIM_ARGS="+UVM_TESTNAME=init_vseq_from_test"
