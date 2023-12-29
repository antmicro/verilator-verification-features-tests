#!/bin/bash

# List of commands to execute
echo "Starting build & run script..."
cd ..
pwd

echo "Building verilator/master..."
cd verilator/master
pwd
git show -q
autoconf
./configure
make -j$(nproc)

echo "Building verilator/randomize-constraints..."
cd ../randomize-constraints
git show -q
autoconf
./configure
make -j$(nproc)

echo "Building uvm-verilator..."
cd ../../uvm
git show -q
autoconf
./configure
make -j$(nproc)

echo "Generating and running tests..."
cd ..
./gen_tests "$@"
robot *.robot

echo "Script execution completed."
