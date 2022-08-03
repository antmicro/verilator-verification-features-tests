{{ verilator_root }}/test_regress
    [Tags]     {{ tags }}
    ${result} =    Run Process    scripts/test_regress    {{ verilator_root }}    --vlt    timeout={{ timeout }}    stdout=out/regression/{{ verilator_root }}/stdout.log    stderr=STDOUT
    Log    ${result.stdout}
    Should Be Equal As Integers    ${result.rc}    0

