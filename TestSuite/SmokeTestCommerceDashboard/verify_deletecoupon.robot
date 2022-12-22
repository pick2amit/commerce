*** Settings ***
Documentation  delete coupon
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/couponpage.robot

Suite Setup    Run Keywords
...    Open Instamojo    AND
...    Login to dashboard
Suite Teardown    Close Instamojo


*** Test Cases ***
Verify deleting Coupon
    [Tags]    Smoke

#Navigate to coupon page
     couponpage.Verify navigating tto discounts
     couponpage.Veriy navigating to coupon page
#delete coupon
     couponpage.delete coupon
     couponpage.verify coupon is deleted