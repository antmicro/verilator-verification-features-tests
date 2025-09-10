
TEST_NAME="Uvm_messaging_example"

SRC_FILES="\
    messaging_example.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS="\
    --error-limit 5 \
    +define+UVM_REPORT_DISABLE_FILE_LINE \
    +define+SVA_ON"

SIM_ARGS=""

