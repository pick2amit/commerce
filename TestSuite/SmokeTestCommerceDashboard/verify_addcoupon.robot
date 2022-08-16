*** Settings ***
Documentation  Add coupon
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/couponpage.robot

Test Setup  Open Instamojo    ${browser}


*** Test Cases ***
Verify Adding Coupon
    [Tags]    Smoke
#LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.Verify The Success Login
#Navigate to coupon page
     couponpage.Verify navigating tto discounts
     couponpage.Veriy navigating to coupon page
#Click add Coupon
     couponpage.Verify navigating to add coupon page
#Select the name of the coupon
     couponpage.enter the name of the coupon
#Select Expiry date
       couponpage.select validunttil date
#update orderamount
        couponpage.update Minimumorder amount
#enter promocode
         couponpage.Enter PromoCode
#enter Proomotype
         couponpage.Enter Promotype
#enter discountpercentage
        couponpage.Enter Discount Percentage
#enter Enter Max discount amount
         couponpage.Enter Max discount amount
#enter count allowed
          couponpage.Enter frequency allowed
#enable coupon options
           couponpage.Enable coupon options
#save coupon
          couponpage.Save the coupon

