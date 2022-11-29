*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/CategoryListPage.robot

Suite Setup    back to homepage

*** Test Cases ***
Add product category
    [Tags]    Smoke
    #LoginPage.Login To Instamojo    ${username}  ${password}
    LHSPage.Open category list page
    CategoryListPage.Verify category list
    CategoryListPage.Open create category form
    CategoryListPage.Verify create category form heading
    CategoryListPage.Enter the category name    ${categories_name}
    #CategoryListPage.Select the active toggle
    #CategoryListPage.Select the featured toggle
    CategoryListPage.Save category
    CategoryListPage.Verify add category success

Edit category
    [Tags]    Smoke
    CategoryListPage.Edit first category
    CategoryListPage.Verify update category

Delete category
    [Tags]    Smoke
    CategoryListPage.Select 1st category from the list
    CategoryListPage.Click on the delete category
    CategoryListPage.Confirm category delete
    CategoryListPage.Verify delete category success