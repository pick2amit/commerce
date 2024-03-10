*** Settings ***
Documentation  Valid login testcase
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource   ../../Utilites/TestSetUp.robot

Test Setup  Open Instamojo    ${browser}
Test Teardown  Close Instamojo

*** Test Cases ***
Verify the validLogin
    [Tags]    Smoke
    LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.Verify The Success Login



