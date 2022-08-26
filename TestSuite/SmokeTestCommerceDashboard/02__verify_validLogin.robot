*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/HomePage.robot

Test Setup    back to homepage
*** Test Cases ***
Verify the validLogin
    [Tags]    Smoke
    LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.Verify The Success Login