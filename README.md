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
well. In order to build properly, after cloning this repository, you shall run
the following command within the repository directory:

```
git submodule update --init --recursive
```

To run these tests, you need
[Robot Framework](https://pypi.org/project/robotframework/),
[PyYAML](https://pypi.org/project/PyYAML/), and
[Jinja2](https://pypi.org/project/Jinja2/) installed on your system.

To automate the process, you can use [act](https://github.com/nektos/act) as a
workflow tool. Even though it is practical to execute, this flow would not
generate the reports within the local repository directory. If you want to run
the workflow manually and get the report automatically, you must first build the
tools manually. In order to do so, execute the commands below when you are
within the repository directory for running a basic script:

```
cd {REPO_DIR}/scripts
```
```
chmod +x build_and_run.sh
```
```
./build_and_run.sh {OPTIONAL_BUILD_OPTS}
```

`gen-tests` is a script that generates Robot test files for each test in the
`tests` directory. To generate and run all tests:

```
./gen-tests
```
```
robot *.robot
```

All tests are divided into several test suites. The file `branches.yml` defines
which suite is tested with which branch of Verilator. To generate tests for a
specific branch of Verilator (e.g. `randomize-constraints`):

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
