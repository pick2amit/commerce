*** Settings ***
Documentation  ProductList
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot
Resource  ../../POMs/Dashboard/Products/AddProductPage.robot
#Resource  ../../POMs/Dashboard/Products/AddProductPage.robot

Test Setup  Open Instamojo    ${browser}
Test Teardown  Close Instamojo

*** Variables ***
${productkacount}

*** Test Cases ***
verify product list page
    LoginPage.Login To Instamojo    amit_kt492  12345678
    LHSPage.Open Product List Page
    ProductListPage.Verify product list

