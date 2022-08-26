*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot

#Test Setup    back to homepage

*** Test Cases ***
verify product list page
    [Tags]    Smoke
    LHSPage.Open Product List Page
    ProductListPage.Verify product list