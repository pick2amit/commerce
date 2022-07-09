*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/CategoryListPage.robot

Test Setup  Open Instamojo    ${browser}
Test Teardown  Close Instamojo

*** Test Cases ***
Delete category
    [Tags]    Smoke
    LoginPage.Login To Instamojo    ${username}  ${password}
    LHSPage.Open category list page
    CategoryListPage.Verify category list

    CategoryListPage.Select 1st category from the list
    CategoryListPage.Click on the delete category
    CategoryListPage.Confirm category delete
    CategoryListPage.Verify delete category success
