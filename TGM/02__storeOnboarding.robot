*** Settings ***
Library  DataDriver    ../DataDriven/TGM - Auto-Batch.xlsx    sheet_name=PD-1
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource  ../POMs/Dashboard/Onboarding/OnboardStep01.robot
Resource  ../POMs/Dashboard/Onboarding/OnboardStep02.robot
Resource  ../POMs/Dashboard/Onboarding/OnboardStep03.robot
Resource  ../POMs/Dashboard/Onboarding/OnboardStep04.robot
Resource  ../POMs/Dashboard/Onboarding/OnboardStep05.robot
Resource  ../POMs/Dashboard/Onboarding/OnboardFinish.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  store onboarding
Suite Teardown    Close Instamojo

*** Test Cases ***
complete store onboarding for: ${email}
    [Tags]    onboard

*** Keywords ***
store onboarding
    [Arguments]    ${email}    ${password}    ${store_name}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}    ${password}
    LHSPage.Click on the Create New button
    # Onboard STEP-01 Enter the Store name
    OnboardStep01.Enter Store Name    ${store_name}
    OnboardStep01.Click On Next Button Of Step01

    # Onboard STEP-02 Enter social media details
    OnboardStep02.Verify The Onboard Step02 Page Is Displayed
    OnboardStep02.Click On Next Button Of Step02

    # Onboard STEP-03 Select the product type
    OnboardStep03.Verify The Onboard Step03 Page Is Displayed
    OnboardStep03.Select Physical Product
    OnboardStep03.CLick on Next Button of Step03

    # Onboard STEP-04 Select Business category
    OnboardStep04.Verify The Onboard Step04 Page Is Displayed
    OnboardStep04.Select RETAIL category
    OnboardStep04.CLick on Next Button of Step04

    #Onboard STEP-05 Select the Store URL
    OnboardStep05.Verify The Onboard Step05 Page Is Displayed
    OnboardStep05.Select 1st Url Suggestion
    OnboardStep05.CLick On The Create Store

    # verify the Final page
    OnboardFinish.Verify The Onboard Finish Page Is Displayed
    sleep    2s