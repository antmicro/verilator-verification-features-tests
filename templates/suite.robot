*** Settings ***
Library           Process
Suite Teardown    Terminate All Processes    kill=True

*** Test Cases ***
{{ test_cases }}
