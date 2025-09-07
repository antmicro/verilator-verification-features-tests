
TEST_NAME="many_to_one"

SRC_FILES="\
    a.sv \
    b.sv \
    c.sv \
    abc_layering.sv \
    env.sv \
    test.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS="+UVM_TESTNAME=test"
