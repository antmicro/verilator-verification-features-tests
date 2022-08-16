{{ test }}
    [Tags]     {{ tags }}
    ${result} =    Run Process    scripts/test    {{ suite }}    {{ test }}    {{ verilator_root }}    timeout={{ timeout }}    stdout=out/{{ suite }}/{{ test }}/stdout.log    stderr=STDOUT
    Log    ${result.stdout}
    Should Not Be Equal As Integers    ${result.rc}    0
