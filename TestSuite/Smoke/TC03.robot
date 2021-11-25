*** Settings ***
Documentation    Suite description
Library  DataDriver  file=../../DataDriven/LoginData.xlsx  sheet_name=Sheet2

Resource  ../../POMs/Dashboard/LoginPage.robot
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/MerchantDashboard.robot

Test Setup  Open Instamojo
Test Teardown  Close Instamojo
Test Template  valid login

*** Test Cases ***

Invalid Login Script ${username}  ${password}   ${case1}  ${case2}  ${case3}


*** Keywords ***
valid login
    [Arguments]    ${username}    ${password}  ${case1}  ${case2}  ${case3}
    Set Selenium Implicit Wait  10s
    Input Text  ${LoginUNTextBox}  ${username}
    Input Password  ${LoginPWTextBox}  ${password}
    Click Button   ${loginButton}
    Run Keyword If  ${case1} == True  Verify the payment intent user succesfully logged in
    Run Keyword If  ${case2} == True  Verify the store intent user succesfully logged in
    Run Keyword If  ${case3} == True  Verify both payment and store intent user succesfully logged in



