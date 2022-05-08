# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-07T14:55:34.687Z

SHELL = /bin/bash #! /bin/bash
SRC_DIR = ./src/
TARGET = colorls.cpp
VERSION = $(shell . ./scripts/version.sh)
CXX = g++
PLATFORM = $(shell echo ${OS})
OBJ_DIR = obj/
ASM_DIR = asm/
BIN = ./bin/
OUT_DIR = $(BIN)$(PLATFORM)/
CXXFLAGS = -std=c++17 -lpthread

.PHONY: all compile clean windows linux

all:
	make prebuild
	make clean
	@echo ""
	@echo "Version: $(VERSION)"
	@echo ""
	@echo "Semantic executable names use the following syntax:"
	@echo "  <app>-<platform>-<version>"
	@echo ""
	@echo ""
	make linux
	make windows
	@echo "$(shell date)" >> $(BIN).last-compile

windows:
	$(CXX) -c ./colorls.cpp -o $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe  $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(BIN)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm  $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(BIN)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(BIN)main.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main.exe

linux:
	$(CXX) -c ./colorls.cpp -o $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION)  $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(BIN)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm  $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(OUT_DIR)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(BIN)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(OUT_DIR)main
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(BIN)main


clean:
	rm -rf ./bin/*
	rm -rf ./.vs/
	mkdir -p ./bin
	mkdir -p ./bin/$(PLATFORM)
	mkdir -p ./bin/obj
	mkdir -p ./bin/asm

install-deps:
	yarn install

prebuild:
	$(SHELL) ./scripts/prebuild.sh
	make install-deps
