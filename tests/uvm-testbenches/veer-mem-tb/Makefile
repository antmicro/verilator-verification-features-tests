all: simulate

NPROC = $$((`nproc`-1))

# -------------------------------------
# Testbench setup
# -------------------------------------
VERILATOR := verilator
ifdef VERILATOR_ROOT
VERILATOR := $(VERILATOR_ROOT)/bin/verilator
endif

UVM_ROOT ?=../../../uvm
UVM_TEST ?= mem_wr_rd_test

VEER_ROOT ?= ../../../third_party/veer-el2

VERILOG_DEFINE_FILES = \
    ${UVM_ROOT}/src/uvm.sv \
    snapshots/default/common_defines.vh \
    ${VEER_ROOT}/design/include/el2_def.sv \
    snapshots/default/el2_pdef.vh

VERILOG_INCLUDE_DIRS = \
    hdl \
    ${UVM_ROOT}/src \
    ${VEER_ROOT}/design/include \
    snapshots/default

VERILOG_SOURCES = \
    ${VEER_ROOT}/design/lib/beh_lib.sv \
    ${VEER_ROOT}/design/lib/mem_lib.sv \
	$(VEER_ROOT)/design/lsu/el2_lsu_dccm_mem.sv \
    ./hdl/tbench_top.sv

# -------------------------------------
# Compilation/simulation configuration
# -------------------------------------
SIM_NAME ?= veer_mem_tb
SIM_DIR := $(SIM_NAME)-sim
COMPILE_ARGS += --top-module tbench_top
COMPILE_ARGS += -DUVM_NO_DPI
COMPILE_ARGS += -fno-gate
COMPILE_ARGS += --prefix $(SIM_NAME) -o $(SIM_NAME)
COMPILE_ARGS += $(addprefix +incdir+, $(VERILOG_INCLUDE_DIRS))
EXTRA_ARGS += --timescale 1ns/1ps --error-limit 100 --trace --trace-structs
WARNING_ARGS += -Wno-lint \
	-Wno-style \
	-Wno-SYMRSVDWORD \
	-Wno-IGNOREDRETURN \
	-Wno-CONSTRAINTIGN \
	-Wno-ZERODLY

# -------------------------------------
# Configure VeeR EL-2
# -------------------------------------
snapshots/default/el2_param.vh:
	$(VEER_ROOT)/configs/veer.config -fpga_optimize=0

# -------------------------------------
# Make UVM test with Verilator
# -------------------------------------
$(SIM_DIR)/$(SIM_NAME).mk: snapshots/default/el2_param.vh $(VERILOG_SOURCES) $(wildcard hdl/*.sv)
	$(VERILATOR) --cc --exe --main --timing -Mdir $(SIM_DIR) \
	${COMPILE_ARGS} ${EXTRA_ARGS} \
	${VERILOG_DEFINE_FILES} \
	${VERILOG_SOURCES} \
	${WARNING_ARGS}

$(SIM_DIR)/$(SIM_NAME): $(SIM_DIR)/$(SIM_NAME).mk
	$(MAKE) -j${NPROC} -C $(SIM_DIR) $(BUILD_ARGS) -f $(SIM_NAME).mk

simulate: $(SIM_DIR)/$(SIM_NAME).mk $(SIM_DIR)/$(SIM_NAME)
	$(SIM_DIR)/$(SIM_NAME) +UVM_TESTNAME=$(UVM_TEST)

clean:
	rm -rf snapshots
	rm -rf simv*.daidir csrc
	rm -rf csrc* simv*
	rm -rf $(SIM_DIR)


.PHONY: simulate clean
