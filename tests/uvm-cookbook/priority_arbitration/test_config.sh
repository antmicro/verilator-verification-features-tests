
TEST_NAME="priority_arbitration/arbitration"

SRC_FILES="\
    top.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""

# Number of simulation runs with different arguments
SIM_ITERATIONS=6

# Arguments for each simulation run
SIM_ARGS_1="+ARB_TYPE=SEQ_ARB_FIFO"
SIM_ARGS_2="+ARB_TYPE=SEQ_ARB_WEIGHTED"
SIM_ARGS_3="+ARB_TYPE=SEQ_ARB_RANDOM"
SIM_ARGS_4="+ARB_TYPE=SEQ_ARB_STRICT_FIFO"
SIM_ARGS_5="+ARB_TYPE=SEQ_ARB_STRICT_RANDOM"
SIM_ARGS_6="+ARB_TYPE=SEQ_ARB_USER"
