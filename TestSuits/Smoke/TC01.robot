*** Settings ***
Documentation    Suite description
Library  DataDriver  file=../../DataDriven/LoginData.xlsx  sheet_name=Sheet1

Resource  ../../POMs/Dashboard/LoginPage.robot
Resource   ../../Utilites/TestSetUp.robot
Resource   ../../Utilites/Browsers.robot

Test Setup  Open Instamojo
Test Teardown  Close Instamojo
Test Template  Invalid login

*** Test Cases ***

Invalid Login Script ${username}  ${password}  ${expectedresult1}  ${expectedresult2}  ${expectedresult3}  ${case1}  ${case2}  ${case3}


*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}  ${expectedresult1}  ${expectedresult2}  ${expectedresult3}  ${case1}  ${case2}  ${case3}
    Input Text  ${LoginUNTextBox}  ${username}
    Input Password  ${LoginPWTextBox}  ${password}
    Click Button   ${loginButton}
    Run Keyword If  ${case1} == False  Element Text Should Be  ${ErrorMessage1}  ${expectedresult1}
    Run Keyword If  ${case2} == False  Element Text Should Be  ${ErrorMessage2}  ${expectedresult2}
    Run Keyword If  ${case3} == False  Element Should Contain  ${ErrorMessage3}  ${expectedresult3}


