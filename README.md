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

This repository contains several submodules that have their own submodules as
well. In order to build properly, after cloning this repository, run
the following command within the repository directory (not necessary if you
use the **scripts/build_and_run.sh** script for executing the flow):

```
git submodule update --init --recursive
```

Or, you may clone the repository by running:

```
git clone --recursive
```

to avoid the need for recursive submodule update.


### Requirements

To run these tests, you need
[Robot Framework](https://pypi.org/project/robotframework/),
[PyYAML](https://pypi.org/project/PyYAML/), and
[Jinja2](https://pypi.org/project/Jinja2/) installed on your system.


### Build and run automatically

To automate the process, you can use [act](https://github.com/nektos/act) as a
workflow tool. Even though it is practical to execute, this flow does not
generate the reports within the local repository directory. If you want to run
the workflow manually and get the report automatically, you must first build the
tools manually. In order to do so through the provided build and run bash script,
execute the command below when you are within the repository directory:

```
./scripts/build_and_run.sh {OPTIONAL_BUILD_OPTS}
```

This script runs the git initialization, Verilator builds, test generation, and
test run. If you would like to run specific commands within the flow, you may
examine **.github/workflows/test.yml** or **scripts/build_and_run.sh**. Running the
script without any **{OPTIONAL_BUILD_OPTS}** would execute all the steps in the
flow. Run the script with **-help** option to get more details on running specific
steps within the flow.

```
./scripts/build_and_run.sh --help
```

# Parse arguments and run individual steps

**{OPTINONAL_BUILD_OPTS}** are listed below:

- **--setup** Sets up the submodules within this repository recursively.
- **--build {TARGET}** Builds the TARGET Verilator branch. Using **--build all** builds
all the Verilator targets within the repository.
- **--gen-tests {TARGET}** Generates tests to be run for the TARGET Verilator branches.
Using **--gen-tests all** generates all the tests within the repository.
- **--run-tests** Runs the generated tests and generates the reports.
**[TBD] flags will be included.**
- **--help** Lists the OPTINONAL_BUILD_OPTS of this script.


### Manually generate and run tests

`gen-tests` is a script that generates Robot test files for each test in the
`tests` directory. To generate and run all tests on an already-built environment,
use:

```
./gen-tests
```
```
robot *.robot
```

All tests are divided into several test suites. The file `branches.yml` defines
which suite is tested with which branch of Verilator. To generate tests for a
specific branch of Verilator (e.g., `randomize-constraints`):

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

The file `tags.yml` allows adding custom tags to specific tests.
