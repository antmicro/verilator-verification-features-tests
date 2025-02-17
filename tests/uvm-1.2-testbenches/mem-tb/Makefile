all: simulate

VERILATOR ?= verilator
ifdef VERILATOR_ROOT
VERILATOR := $(VERILATOR_ROOT)/bin/verilator
endif

UVM_ROOT ?=../../../uvm-1.2
UVM_ROOT_ABS = ${shell realpath $(UVM_ROOT)}

SIM_DIR ?= $(shell pwd)/mem_tb-sim
UVM_TEST ?= mem_wr_rd_test

simulate:
	$(MAKE) -C mem-tb simulate VERILATOR=$(VERILATOR) UVM_ROOT=$(UVM_ROOT_ABS) SIM_DIR=$(SIM_DIR) UVM_TEST=$(UVM_TEST)

clean:
	$(MAKE) -C mem-tb clean

.PHONY: simulate clean
