
TEST_NAME="generation_sequence_randomization/ex1_sequence_randomization"

SRC_FILES="\
    ../common/bus_if.sv \
    ../common/dut.sv \
    ../common/bus_agent_pkg.sv \
    ../sequence_library/bus_seq_lib_pkg.sv \
    ../tests/test_lib_pkg.sv \
    ../common/top_tb.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS="+UVM_TESTNAME=seq_rand_test"
