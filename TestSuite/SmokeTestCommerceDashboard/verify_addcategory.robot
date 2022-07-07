*** Settings ***
Documentation  Add Product
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/CategoryListPage.robot

Test Setup  Open Instamojo    ${browser}
Test Teardown  Close Instamojo

*** Test Cases ***
Add product category
    [Tags]    Smoke
    LoginPage.Login To Instamojo    ${username}  ${password}
    LHSPage.Open category list page
    CategoryListPage.Verify category list
    CategoryListPage.Open create category form
    CategoryListPage.Verify create category form heading
    CategoryListPage.Enter the category name
    #CategoryListPage.Select the active toggle
    #CategoryListPage.Select the featured toggle
    CategoryListPage.Save category
    CategoryListPage.Verify add category success