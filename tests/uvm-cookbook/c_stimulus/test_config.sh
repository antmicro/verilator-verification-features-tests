
TEST_NAME="c_stimulus/block_level_example/sim"

SRC_FILES="\
    +incdir+../../c_stimulus_pkg \
    ../../c_stimulus_pkg/c_stimulus_pkg.sv \
    +incdir+../../c_stimulus_pkg \
    ../../c_stimulus_pkg/isr_pkg.sv \
    +incdir+../rtl/spi/rtl/verilog \
    ../rtl/spi/rtl/verilog/*.v \
    +incdir+../agents/apb_agent \
    ../agents/apb_agent/apb_agent_pkg.sv \
    +incdir+../agents/spi_agent \
    ../agents/spi_agent/spi_agent_pkg.sv \
    +incdir+../uvm_tb/uvm_register_model \
    ../uvm_tb/uvm_register_model/spi_reg_pkg.sv \
    ../agents/apb_agent/apb_if.sv \
    ../agents/spi_agent/spi_if.sv \
    ../uvm_tb/tb/intr_if.sv \
    +incdir+../uvm_tb/env \
    ../uvm_tb/env/spi_env_pkg.sv \
    +incdir+../uvm_tb/sequences \
    ../uvm_tb/sequences/spi_bus_sequence_lib_pkg.sv \
    +incdir+../uvm_tb/sequences \
    ../uvm_tb/sequences/spi_sequence_lib_pkg.sv \
    +incdir+../uvm_tb/sequences \
    ../uvm_tb/sequences/spi_virtual_seq_lib_pkg.sv \
    +incdir+../uvm_tb/test \
    ../uvm_tb/test/spi_test_lib_pkg.sv \
    +incdir+../rtl/spi/rtl/verilog \
    ../uvm_tb/tb/top_tb.sv \
    +incdir+../../c_stimulus_pkg \
    ../../c_stimulus_pkg/reg_api.c \
    +incdir+../c_code \
    ../c_code/spi_int_test.c \
    +incdir+../c_code \
    ../c_code/spi_c_poll_test.c"

# Test-specific flags
TEST_VERILATOR_FLAGS='-CFLAGS "-I../../c_stimulus_pkg"'
SIM_ARGS=""
