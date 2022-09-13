*** Settings ***
Library  DataDriver    ../DataDriven/TGM-13Sep.xlsx   sheet_name=PD1-5
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/Onboarding/compliancePage.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  Add compliance
Suite Teardown    Close Instamojo

*** Test Cases ***
Add GST PAN details for: ${email}
    [Tags]    billing_info    all

*** Keywords ***
Add compliance
    [Arguments]    ${email}  ${password}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo    ${email}  ${password}
    loginpage.verify the success login
    LHSPage.Open profile dropdown & log store URL
#    compliancePage.verify that compliance page displayed
#    compliancePage.Enter PAN    AAAAA1111A
#    compliancePage.Enter Name    Test Account
#    compliancePage.Enter Address    Bangalore
#    compliancePage.Enter State    Karnataka
#    compliancePage.Enter PIN    560034
#    compliancePage.Save compliance detail
#    compliancePage.Verify compliance submitted