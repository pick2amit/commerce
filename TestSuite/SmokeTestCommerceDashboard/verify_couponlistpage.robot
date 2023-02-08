*** Settings ***

Documentation    couponlistpage
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/couponpage.robot

Suite Setup    Run Keywords
...    Open Instamojo    AND
...    Login to dashboard
Suite Teardown    Close Instamojo

*** Test Cases ***
Verify coupon list page
    [Tags]    Smoke

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