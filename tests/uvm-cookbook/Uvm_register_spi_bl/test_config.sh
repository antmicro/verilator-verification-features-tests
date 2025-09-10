
TEST_NAME="Uvm_register_spi_bl/block_level_tbs/spi_tb/sim"

SRC_FILES="\
    +incdir+../../../rtl/spi/rtl/verilog ../../../rtl/spi/rtl/verilog/*.v \
    +incdir+../../../agents/apb_agent +incdir+../../../utils ../../../agents/apb_agent/apb_agent_pkg.sv \
    +incdir+../../../agents/spi_agent +incdir+../../../utils ../../../agents/spi_agent/spi_agent_pkg.sv \
    +incdir+../register_model ../register_model/spi_reg_pkg.sv \
    ../../../agents/apb_agent/apb_if.sv \
    ../../../agents/apb_agent/apb_monitor_bfm.sv \
    ../../../agents/apb_agent/apb_driver_bfm.sv \
    ../../../agents/spi_agent/spi_if.sv \
    ../../../agents/spi_agent/spi_monitor_bfm.sv \
    ../../../agents/spi_agent/spi_driver_bfm.sv \
    ../../../utils/interrupt/intr_pkg.sv \
    ../../../utils/interrupt/intr_if.sv \
    ../../../utils/interrupt/intr_bfm.sv \
    +incdir+../env ../env/spi_env_pkg.sv \
    +incdir+../sequences ../sequences/spi_bus_sequence_lib_pkg.sv \
    +incdir+../sequences ../sequences/spi_test_seq_lib_pkg.sv \
    +incdir+../test ../test/spi_test_lib_pkg.sv \
    +incdir+../../../rtl/spi/rtl/verilog ../tb/hvl_top.sv \
    +incdir+../../../rtl/spi/rtl/verilog ../tb/hdl_top.sv \
    +incdir+../../../utils/interrupt"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS="+UVM_TESTNAME=spi_interrupt_test"
