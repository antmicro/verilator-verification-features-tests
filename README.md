# Verilator Verification Features Tests

Copyright (c) 2022 [Antmicro](https://www.antmicro.com)

This repository contains tests for a number of verification features in
Verilator:

* concurrent assertions,
* functional coverage,
* randomization constraints,
* class parameters,
* sequences,

and more.

## Usage

To run these tests, you need Robot Framework and Jinja2 installed on your
system. `gen-tests` is a script that generates Robot test files for each test in
the `tests` directory. To generate and run all tests:

```
./gen-tests
robot robot_tests
```

All tests are divided into several test suites. If a test suite has the same
name as one of the submodules in the `verilator` directory (these are named
after Verilator branches), `gen-tests` can generate tests only from that
specific suite. To generate tests for a specific branch of Verilator (e.g.
`randomize-constraints`):

```
./gen-tests randomize-constraints
```

Multiple branches can be passed:

```
./gen-tests master randomize-constraints
```

Robot tests are generated from Jinja2 templates in the `templates` directory.
While generating tests for a given test suite, a template with the same name as
the test suite is used. If no such template exists, the `default` template is
used.
