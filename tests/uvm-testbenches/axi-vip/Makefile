all: simulate

NPROC = $$((`nproc`-1))

VERILATOR := verilator
ifdef VERILATOR_ROOT
VERILATOR := $(VERILATOR_ROOT)/bin/verilator
endif

SIM_DIR := obj_dir
WARNING_ARGS = -DUVM_ENABLE_DEPRECATED_API -DUVM_NO_DPI -Wno-lint -Wno-TIMESCALEMOD -Wno-SYMRSVDWORD -Wno-CONSTRAINTIGN

$(SIM_DIR)/Vuvm_pkg: $(wildcard hdl/*.sv)
	cd axi-vip && $(VERILATOR) --binary -I$(UVM_ROOT)/src $(UVM_ROOT)/src/uvm_pkg.sv -f axi.f $(WARNING_ARGS) --bbox-sys -fno-inline --verilate-jobs $(NPROC) --build-jobs $(NPROC) --timescale-override 1ns/1ps --assert -Mdir ../$(SIM_DIR)

simulate: $(SIM_DIR)/Vuvm_pkg
	$(SIM_DIR)/Vuvm_pkg +UVM_TESTNAME=axi_wrap_test

clean:
	rm -rf $(SIM_DIR)

.PHONY: simulate clean
