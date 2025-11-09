#!/bin/bash

iverilog -o output.vvp tb.v operators.v triggers.v schemes.v

vvp output.vvp