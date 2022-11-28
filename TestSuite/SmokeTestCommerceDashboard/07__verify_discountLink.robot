*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/HomePage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Discounts/DiscountLinks.robot

Suite Setup  back to homepage
Suite Teardown    Close Instamojo


*** Test Cases ***
Verify the Discount links page
    [Tags]    tt
    LoginPage.Verify the login page is displayed
    LoginPage.Login to instamojo   ${username}  ${password}    #amit_ktjun10    test12
    LoginPage.Verify the success login
    LHSPage.Open discount link page
    DiscountLinks.Verify discount link page

Verify add discount link
    [Tags]    tt
    ${DiscountCode}=    DiscountLinks.Add discount link    NOV22    2    1    This is a
    ${DiscountCodeFromList}=    DiscountLinks.Get discount code text
    should be equal as strings  ${DiscountCode}  ${DiscountCodeFromList}

Verify delete discount link
    [Tags]    tt
    DiscountLinks.Delete discount link    1
    DiscountLinks.Verify delete link