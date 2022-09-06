*** Settings ***
#Library  DataDriver    ../DataDriven/TGM - Auto-Batch.xlsx    sheet_name=PD-1
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource    ../POMs/Store/StoreHomePage.robot

Test Setup    Open Instamojo
Test Teardown    Close Instamojo

*** Variables ***
${about_me}    Homemade 💯 100% veg Just think what you want And I’ll make it to you🤩
${about_me}   Encode String toBytes ${about_me}   UTF-8
*** Test Cases ***
Update store's About us section
    [Tags]    sk99
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  amit_kt509    12345678
    LHSPage.Open store from profile
    StoreHomePage.enable editing
    StoreHomePage.update the Welcome section  Welcome \n\n ${about_me}
    #StoreHomePage.add BMPs    Welcome \n\n ${about_me}

#    LHSPage.Open store from profile
#    StoreHomePage.enable editing
#    StoreHomePage.change the Welcome text format

