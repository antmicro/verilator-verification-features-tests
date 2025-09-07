
TEST_NAME="Uvm_tb_build_ss_tb/sub_system_tbs/pss_tb/sim"

SRC_FILES="\
    +incdir+../../../agents/apb_agent +incdir+../../../utils ../../../agents/apb_agent/apb_agent_pkg.sv \
    +incdir+../../../agents/spi_agent +incdir+../../../utils ../../../agents/spi_agent/spi_agent_pkg.sv \
    +incdir+../../../agents/ahb_agent +incdir+../../../utils ../../../agents/ahb_agent/ahb_agent_pkg.sv \
    +incdir+../../../agents/gpio_agent +incdir+../../../utils ../../../agents/gpio_agent/gpio_agent_pkg.sv \
    +incdir+../../../agents/modem_agent +incdir+../../../utils ../../../agents/modem_agent/modem_agent_pkg.sv \
    +incdir+../../../agents/uart_agent +incdir+../../../utils ../../../agents/uart_agent/uart_agent_pkg.sv \
    ../../../agents/apb_agent/apb_if.sv \
    ../../../agents/apb_agent/apb_monitor_bfm.sv \
    ../../../agents/apb_agent/apb_driver_bfm.sv \
    ../../../agents/spi_agent/spi_if.sv \
    ../../../agents/spi_agent/spi_monitor_bfm.sv \
    ../../../agents/spi_agent/spi_driver_bfm.sv \
    ../../../agents/gpio_agent/gpio_if.sv \
    ../../../agents/gpio_agent/gpio_monitor_bfm.sv \
    ../../../agents/gpio_agent/gpio_driver_bfm.sv \
    ../../../agents/ahb_agent/ahb_if.sv \
    ../../../agents/ahb_agent/ahb_monitor_bfm.sv \
    ../../../agents/ahb_agent/ahb_driver_bfm.sv \
    ../../../agents/modem_agent/modem_if.sv \
    ../../../agents/modem_agent/modem_monitor_bfm.sv \
    ../../../agents/modem_agent/modem_driver_bfm.sv \
    ../../../agents/uart_agent/serial_if.sv \
    ../../../agents/uart_agent/uart_monitor_bfm.sv \
    ../../../agents/uart_agent/uart_driver_bfm.sv \
    ../../../utils/interrupt/intr_pkg.sv \
    ../../../block_level_tbs/gpio_tb/tb/intr_if.sv \
    ../../../utils/interrupt/intr_bfm.sv \
    +incdir+../../../utils/interrupt \
    +incdir+../../../block_level_tbs/spi_tb/register_model ../../../block_level_tbs/spi_tb/register_model/spi_reg_pkg.sv \
    +incdir+../../../block_level_tbs/gpio_tb/register_model ../../../block_level_tbs/gpio_tb/register_model/gpio_reg_pkg.sv \
    +incdir+../register_model ../register_model/pss_reg_pkg.sv \
    +incdir+../../../block_level_tbs/spi_tb/env ../../../block_level_tbs/spi_tb/env/spi_env_pkg.sv \
    +incdir+../../../block_level_tbs/gpio_tb/env ../../../block_level_tbs/gpio_tb/env/gpio_env_pkg.sv \
    +incdir+../env ../env/pss_env_pkg.sv \
    +incdir+../../../block_level_tbs/spi_tb/sequences ../../../block_level_tbs/spi_tb/sequences/spi_bus_sequence_lib_pkg.sv \
    +incdir+../../../block_level_tbs/spi_tb/sequences ../../../block_level_tbs/spi_tb/sequences/spi_test_seq_lib_pkg.sv \
    +incdir+../../../block_level_tbs/gpio_tb/sequences ../../../block_level_tbs/gpio_tb/sequences/gpio_bus_sequence_lib_pkg.sv \
    +incdir+../../../block_level_tbs/gpio_tb/sequences ../../../block_level_tbs/gpio_tb/sequences/gpio_test_sequence_lib_pkg.sv \
    +incdir+../sequences ../sequences/pss_test_seq_lib_pkg.sv \
    +incdir+../test ../test/pss_test_lib_pkg.sv"

# Test-specific flags
TEST_VERILATOR_FLAGS=""
SIM_ARGS="+UVM_TESTNAME=pss_spi_interrupt_test"
