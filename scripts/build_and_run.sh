#!/bin/env bash

# Determine the directory where the script is located
SCRIPT_DIR=$(realpath $(dirname "$0"))

# Define the log file relative to the script's location
LOGFILE="$SCRIPT_DIR/../build_and_run.log"

# Clear the log file at the start of the script
> "$LOGFILE"

# Function to execute a command and log its output
execute_and_log() {
    COMMAND="$1"
    shift
    ARGS="$@"
    echo "Executing: $COMMAND $ARGS"
    echo "--------------------------------------------------" >> "$LOGFILE"
    echo "COMMAND: $COMMAND $ARGS" >> "$LOGFILE"
    echo "OUTPUT:" >> "$LOGFILE"
    eval "$COMMAND $ARGS" >> "$LOGFILE" 2>&1
    echo "--------------------------------------------------" >> "$LOGFILE"
}

# Start of the script execution
echo "Starting build & run script..."
execute_and_log "git submodule update --init --recursive"

# Adjust the directory changes to be relative to the script's location
execute_and_log "cd $SCRIPT_DIR/.."
execute_and_log "pwd"

echo "Building verilator/master..."
execute_and_log "cd $SCRIPT_DIR/../verilator/master"
execute_and_log "pwd"
execute_and_log "git show -q"
execute_and_log "autoconf"
execute_and_log "./configure"
execute_and_log "make -j$(nproc)"

echo "Building verilator/randomize-constraints..."
execute_and_log "cd $SCRIPT_DIR/../verilator/randomize-constraints"
execute_and_log "git show -q"
execute_and_log "autoconf"
execute_and_log "./configure"
execute_and_log "make -j$(nproc)"

echo "Generating and running tests..."
execute_and_log "cd $SCRIPT_DIR/../"
execute_and_log "pwd"
execute_and_log "./gen-tests $@"
execute_and_log "robot $SCRIPT_DIR/../*.robot"

echo "Script execution completed."
