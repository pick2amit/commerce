*** Settings ***
Documentation    Homepage smoke test
Resource   ../../Resources/Common/CommonWeb.robot
Resource   ../../Resources/StoreFront/StoreFrontApp.robot
Library  DataDriver     ../../DataManager/Store_login_data_v2.xlsx    sheet_name=Sheet1

Test Setup      Start web test
Test Teardown   End web test
Test Template   invalid login tests

*** Variables ***
${STOREFRONT_URL} =   https://amit-kt501.myinstamojo.com/
${BROWSER} =          chrome

*** Test Cases ***
This is a invalid test case for ${EMAIL} and ${PASSWORD}
    [Tags]    Smoke

*** Keywords ***
invalid login tests
    [Arguments]    ${EMAIL}     ${PASSWORD}      ${ERROR_MESSAGE}   ${ERROR_TYPE}
    StoreFrontApp.login on the store with Invalid credentials
    ...    ${EMAIL}    ${PASSWORD}    ${ERROR_MESSAGE}    ${ERROR_TYPE}