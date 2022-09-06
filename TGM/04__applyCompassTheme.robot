*** Settings ***
Library  DataDriver    ../DataDriven/TGM - Auto-Batch.xlsx    sheet_name=PD-1
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource    ../POMs/Dashboard/StoreSetup/ThemesPage.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  Select theme
Suite Teardown    Close Instamojo

*** Test Cases ***
Select theme for user: ${useremail}
    [Tags]    theme
*** Keywords ***
Select theme
    [Arguments]    ${useremail}    ${userpassword}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${useremail}    ${userpassword}
    loginpage.Verify the success login

    LHSPage.Open theme page
    ${CurrentTheme}    ThemesPage.get the applied theme
    pass execution if    '${CurrentTheme}' == 'Compass'    Compass Theme already applied.
    ThemesPage.select compass theme