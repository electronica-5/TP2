TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

VERILOG_SOURCES = $(PWD)/../../ALU.v

TOPLEVEL := ALU
MODULE   := alu_TB

include $(shell cocotb-config --makefiles)/Makefile.sim
