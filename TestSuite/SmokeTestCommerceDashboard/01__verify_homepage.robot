*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/HomePage.robot

Suite Setup  Open Instamojo
Suite Teardown    Close Instamojo
*** Test Cases ***
Verify the landing/home page
    [Tags]    Smoke
    LoginPage.Open the homepage
    HomePage.Verify the homepage