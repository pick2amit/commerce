*** Settings ***
Documentation  couponpage
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/couponpage.robot

Test Setup  Open Instamojo    ${browser}


*** Test Cases ***
Verify coupon list page
    [Tags]    Smoke

#LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.Verify The Success Login
#Navigate to coupon page
     couponpage.Verify navigating tto discounts
     couponpage.Veriy navigating to coupon page
#verify add coupon button is seen
     couponpage.verify addcoupon button is present
#Verify search option is seen
      couponpage.verify if search option is seen
#verify if coupon actions are seen
      couponpage.verify if action options are seen
#verify if pagenation is seen
      couponpage.verify pagenation is seen
#verify if table options are seen
      couponpage.verify table sort options are seen