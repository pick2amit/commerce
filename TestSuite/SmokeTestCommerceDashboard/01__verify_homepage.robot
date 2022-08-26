*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/HomePage.robot

Test Setup  Open Instamojo    headlesschrome
#Test Setup    Open ChromeHeadless
*** Test Cases ***
Verify the landing/home page
    [Tags]    Smoke
    HomePage.Verify the homepage