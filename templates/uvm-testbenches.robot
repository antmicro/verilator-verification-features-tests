{{ test }}
    [Tags]     {{ tags }}
    Run Process    make    -C    tests/{{ suite }}/{{ test }}    clean
    ${result} =    Run Process    make    -C    tests/{{ suite }}/{{ test }}    env:UVM_ROOT=%{PWD}/uvm/uvm-2017    env:VERILATOR_ROOT=%{PWD}/{{ verilator_root }}    stdout=out/{{ suite }}/{{ test }}/stdout.log    stderr=STDOUT
    Log    ${result.stdout}
    Run Keyword If    ${result.rc}==-15    Set Tags    Timeout
    Should Be Equal As Integers    ${result.rc}    0

