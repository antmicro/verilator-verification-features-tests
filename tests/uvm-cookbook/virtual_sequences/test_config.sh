
TEST_NAME="virtual_sequences/standalone_find_all"

SRC_FILES="\
    +incdir+./simple_ovc \
    ./simple_ovc/simple_pkg.sv \
    top.sv"

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
