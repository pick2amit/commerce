*** Settings ***
Library  pabot.PabotLib
Library  DataDriver    ../DataDriven/TGM-akt.xlsx   sheet_name=${current_sheet}
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource    ../POMs/Dashboard/StoreSetup/ThemesPage.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  Select theme
Suite Teardown    Close Instamojo

*** Test Cases ***
Select theme for user: ${email}
    [Tags]    apply_theme    all
*** Keywords ***
Select theme
    [Arguments]    ${email}    ${password}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}    ${password}
    LHSPage.Open theme page
    ${CurrentTheme}    ThemesPage.get the applied theme
    pass execution if    '${CurrentTheme}' == 'Compass'    Compass Theme already applied.
    ThemesPage.select compass theme
    ThemesPage.Verify compass theme applied