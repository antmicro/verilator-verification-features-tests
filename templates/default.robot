{{ test }}
    [Tags]     {{ tags }}
    ${result} =    Run Process    scripts/test    {{ suite }}    {{ test }}    {{ verilator_root }}    stdout=out/{{ suite }}/{{ test }}/stdout.log    stderr=STDOUT
    Log    ${result.stdout}
    Run Keyword If    ${result.rc}==-15    Set Tags    Timeout
    Should Be Equal As Integers    ${result.rc}    0

