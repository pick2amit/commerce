*** Settings ***
Library  DataDriver    ../DataDriven/TGM-akt.xlsx   sheet_name=PD1-10
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
    [Tags]    upgrade_plan    all

*** Keywords ***
plan upgrade
    [Arguments]  ${email}  ${password}
    loginpage.Verify the login page is displayed
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}  ${password}
    LHSPage.Open subscription plan from profile
    ${currentplan}=    SubscriptionPage.get current plan
    log   ${currentplan}
    pass execution if  '${currentplan}' == 'Growth Yearly'    Already upgraded to GROWTH Plan

    SubscriptionPage.select yearly plan and proceed
    SubscriptionPage.Make payment using coupon    TGM
    ${currentplan}=    SubscriptionPage.get current plan
    log   Updated Plan: ${currentplan}
    SubscriptionPage.Verify plan upgrade