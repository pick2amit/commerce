*** Settings ***
Documentation  Valid login testcase
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource   ../../Utilites/TestSetUp.robot

Test Setup  Open Instamojo    ${Browser}
Test Teardown  Close Instamojo

*** Test Cases ***
Verify the validLogin
    [Tags]    Smoke
    LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  amit_kt55  test12
    LoginPage.Verify The Success Login



