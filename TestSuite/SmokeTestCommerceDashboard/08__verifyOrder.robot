*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Orders/OrderListPage.robot
Resource  ../../POMs/Dashboard/Orders/OrderDetailPage.robot

Suite Setup    Run Keywords
...    Open Instamojo    AND
...    Login to dashboard
Suite Teardown    Close Instamojo

*** Test Cases ***
Verify Order listpage
    [Tags]    Smoke
    LHSPage.Open order list page
    OrderListPage.Verify order list

Verify order detail
    [Tags]    Smoke
    OrderListPage.Open order detail page
    OrderDetailPage.Verify order details