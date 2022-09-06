*** Settings ***
Library  DataDriver    ../DataDriven/TGM - Auto-Batch.xlsx    sheet_name=PD-1
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource    ../POMs/Dashboard/SubscriptionPage.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template    plan upgrade
Suite Teardown    Close Instamojo


*** Test Cases ***
upgrade user plan for: ${email}
    [Tags]    upgrade

*** Keywords ***
plan upgrade
    [Arguments]  ${email}  ${password}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}  ${password}
    LHSPage.Open subscription plan from profile
    SubscriptionPage.select yearly plan and proceed
    SubscriptionPage.Make payment using coupon    TGM
    SubscriptionPage.Verify plan upgrade