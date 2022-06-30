*** Settings ***
Documentation  Verify the landing/home page
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/HomePage.robot

Test Setup  Open Instamojo    ${Browser}
Test Teardown  Close Instamojo

*** Test Cases ***
Verify the landing/home page
    LoginPage.Open the homepage

    HomePage.Verify the homepage