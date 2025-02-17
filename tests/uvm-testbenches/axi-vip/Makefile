all: simulate

NPROC = $$((`nproc`-1))

VERILATOR := verilator
ifdef VERILATOR_ROOT
VERILATOR := $(VERILATOR_ROOT)/bin/verilator
endif
UVM_ROOT ?= ../../../uvm
UVM_ROOT_ABS = ${shell realpath $(UVM_ROOT)}

SIM_DIR ?= $(shell pwd)/axi-vip-sim
TOP_NAME := axi_vip
BIN_NAME := axi-vip
UVM_TEST ?= axi_wrap_test
UVM_FILES := -I$(UVM_ROOT_ABS)/src $(UVM_ROOT_ABS)/src/uvm_pkg.sv
AXI_VIP_FILES := -f axi.f
DEFINES := -DUVM_ENABLE_DEPRECATED_API -DUVM_NO_DPI
WARNINGS = -Wno-lint -Wno-TIMESCALEMOD -Wno-SYMRSVDWORD -Wno-CONSTRAINTIGN
OTHER_FLAGS := --bbox-sys --timescale-override 1ns/1ps --assert
TEMPFILE := $(shell mktemp)

$(SIM_DIR)/$(BIN_NAME): $(shell find axi-vip -type f)
	cd axi-vip && \
		$(VERILATOR) --binary $(UVM_FILES) $(AXI_VIP_FILES) $(DEFINES) $(WARNINGS) $(OTHER_FLAGS) \
		--verilate-jobs $(NPROC) --build-jobs $(NPROC) -Mdir $(SIM_DIR) --prefix $(TOP_NAME) -o $(BIN_NAME)

simulate: $(SIM_DIR)/$(BIN_NAME)
	$(SIM_DIR)/$(BIN_NAME) +UVM_TESTNAME=$(UVM_TEST) | tee $(TEMPFILE)
	@grep "^UVM_ERROR\\s*:\\s*0$$" $(TEMPFILE) -q
	@grep "^UVM_FATAL\\s*:\\s*0$$" $(TEMPFILE) -q
	@grep "^Test PASSED$$" $(TEMPFILE) -q

clean:
	rm -rf $(SIM_DIR)

.PHONY: simulate clean
