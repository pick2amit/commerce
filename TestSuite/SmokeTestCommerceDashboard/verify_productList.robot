*** Settings ***
Documentation  ProductList
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot
Resource  ../../POMs/Dashboard/Products/AddProductPage.robot
#Resource  ../../POMs/Dashboard/Products/AddProductPage.robot



Test Setup  Open Instamojo    ${Browser}
Test Teardown  Close Instamojo

*** Variables ***
${productkacount}

*** Test Cases ***
verify product list page
    LoginPage.Login To Instamojo    amit_kt55  test12
    LHSPage.Open Product List Page

    ProductListPage.Get product count
    ${productkacount} =    ProductListPage.Get product count
    log to console  from testcase: ${productkacount}
    #ProductListPage.My experment

