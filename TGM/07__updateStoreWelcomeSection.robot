*** Settings ***
Library  pabot.PabotLib
Library  DataDriver    ../DataDriven/TGM-akt.xlsx   sheet_name=${current_sheet}
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource    ../POMs/Store/StoreHomePage.robot

Test Setup    Open Instamojo
Test Template    update store welcome section
Test Teardown    Close Instamojo

*** Test Cases ***
Update store's About us section for: ${email}
    [Tags]    update_welcome    all

*** Keywords ***
update store welcome section
    [Arguments]    ${email}    ${password}    ${about_me}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}    ${password}
    LHSPage.Open store from profile
    StoreHomePage.enable editing
    ${content}=    StoreHomePage.get welcome section content
    pass execution if    '${content}' == '${about_me}'    Content already updated

    StoreHomePage.update the Welcome section    Welcome \n\n ${about_me}