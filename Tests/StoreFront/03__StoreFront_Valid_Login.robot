*** Settings ***
Documentation    Homepage smoke test
Resource   ../../Resources/Common/CommonWeb.robot
Resource   ../../Resources/StoreFront/StoreFrontApp.robot
Test Setup      Start web test
Test Teardown   End web test

*** Variables ***
${STOREFRONT_URL} =   https://amit-kt501.myinstamojo.com/
${BROWSER} =          chrome

${USER_EMAIL}         amit.kt@instamojo.com
${USER_PASSWORD}      12345678

*** Test Cases ***
Home page should load
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.login on the store with valid credentials     ${USER_EMAIL}       ${USER_PASSWORD}