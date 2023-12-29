#!/bin/bash

# Define the log file
LOGFILE="../build_and_run.log"

# Function to execute a command and log its output
execute_and_log() {
    echo "Executing: $1"
    echo "--------------------------------------------------" >> "$LOGFILE"
    echo "COMMAND: $1" >> "$LOGFILE"
    echo "OUTPUT:" >> "$LOGFILE"
    eval $1 >> "$LOGFILE" 2>&1
    echo "--------------------------------------------------" >> "$LOGFILE"
}

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
./gen-tests
robot *.robot

echo "Script execution completed. Check the log at $LOGFILE"
