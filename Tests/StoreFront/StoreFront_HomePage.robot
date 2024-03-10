*** Settings ***
Documentation    Homepage smoke test
Resource   ../../Resources/Common/CommonWeb.robot
Resource   ../../Resources/StoreFront/StoreFrontApp.robot
Test Setup      Start web test
Test Teardown   End web test

*** Variables ***
${STOREFRONT_URL} =   https://amit-kt501.myinstamojo.com/
${BROWSER} =          chrome

*** Test Cases ***
Home page should load
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.Verify the page is loaded

Home page title should match
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.Verify the homepage title


Home page banner should be present
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.Verify the homepage banner

Product showcase should be present
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.Verify the product showcase

Products link in the showcase should work
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.Verify the navigation to prduct detail page