
TEST_NAME="biquad_example/sim"

SRC_FILES="\
    ../rtl/*.sv \
    ../tb/agents/signal_agent/signal_if.sv \
    ../tb/agents/apb_agent/apb_if.sv \
    +incdir+../tb/agents/apb_agent \
    ../tb/agents/apb_agent/apb_agent_pkg.sv \
    +incdir+../tb/agents/signal_agent \
    ../tb/agents/signal_agent/signal_agent_pkg.sv \
    ../tb/registers/biquad_reg_pkg.sv \
    +incdir+../tb/env \
    ../tb/env/biquad_env_pkg.sv \
    +incdir+../tb/sequences \
    ../tb/sequences/biquad_vseq_pkg.sv \
    +incdir+../tb/test \
    ../tb/test/biquad_test_pkg.sv \
    ../tb/tb/biquad_tb.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS=""

# This particular test requires UVM 1.2 this is the simplest workaround to not edit majority of scripts
GLOBAL_VERILATOR_FLAGS="\
    --binary \
    --Mdir verilator_obj_dir \
    --error-limit 15 \
    -j $(nproc) \
    $VERILATOR_WORKAROUNDS \
    +define+UVM_NO_DPI \
    +incdir+$UVM_DIR_1_2 \
    $UVM_DIR_1_2/uvm_pkg.sv"
