*** Settings ***
Documentation  delete coupon
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/couponpage.robot

Test Setup  Open Instamojo    ${browser}


*** Test Cases ***
Verify deleting Coupon
    [Tags]    Smoke
#LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.Verify The Success Login
#Navigate to coupon page
     couponpage.Verify navigating tto discounts
     couponpage.Veriy navigating to coupon page
#delete coupon
     couponpage.delete coupon
     couponpage.verify coupon is deleted