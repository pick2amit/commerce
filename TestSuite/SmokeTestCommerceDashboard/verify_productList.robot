*** Settings ***
Documentation  ProductList
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot

Test Setup  Open Instamojo    ${browser}
Test Teardown  Close Instamojo

*** Test Cases ***
verify product list page
    [Tags]    Smoke
    LoginPage.Login To Instamojo    ${username}  ${password}
    LHSPage.Open Product List Page
    ProductListPage.Verify product list