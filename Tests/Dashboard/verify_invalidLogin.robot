*** Settings ***
Documentation  Invalid login testcase for the various combination of username, password
Library  DataDriver    ../../DataDriven/LoginData.xlsx
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource   ../../Utilites/TestSetUp.robot

Test Setup  Open Instamojo    ${Browser}
Test Teardown  Close Instamojo
Test Template    Invalid login

*** Test Cases ***
    Verify the invalidLogin testcases    {username}    {password}    {error_message}
    [Tags]    None

*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}    ${error_message}
    LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.verify the error message for invalid login    ${error_message}