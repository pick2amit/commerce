*** Settings ***
Library  pabot.PabotLib
Library  DataDriver    ../DataDriven/TGM-akt.xlsx   sheet_name=${current_sheet}
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource    ../POMs/Dashboard/StoreSetup/LogoPage.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  add logo
Suite Teardown    Close Instamojo

*** Test Cases ***
Add logo for user: ${email}
    [Tags]    add_logo    all

*** Keywords ***
add logo
    [Arguments]    ${email}    ${password}    ${logo_image}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}    ${password}
    LHSPage.Open logo page
    LogoPage.Verify logo page displayed
    ${status}=    run keyword and return status  LogoPage.Verify logo added
    pass execution if   ${status}    Logo already added

    LogoPage.add store logo    ${logo_image}
    LogoPage.Verify logo added