#!/usr/bin/env python3

import fileinput

take = False
for line in fileinput.input():
    if line == "#  quit -f\n":
        take = False
    if take:
        # questa doesn't work if a path ends without /.
        # If it ends with it, it is duplicated in a path.
        line = line.replace("uvm//src", "uvm/src")
        # remove preceeding "# " and newline at the end
        print(line[2:-1])
    if line == "# run -all\n":
        take = True
