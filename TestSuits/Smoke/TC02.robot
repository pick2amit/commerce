*** Settings ***
Library  SeleniumLibrary
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/SignupPage.robot
Resource  ../../POMs/Dashboard/OtpPage.robot
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/SelectIntent.robot
Resource  ../../POMs/Dashboard/PaymentLink.robot
Resource  ../../POMs/Dashboard/BusinessType.robot
Resource  ../../POMs/Dashboard/BusinessDetails.robot
Resource  ../../POMs/Dashboard/MoreBusinessDetails.robot
Resource  ../../POMs/Dashboard/BankDetails.robot
Resource  ../../POMs/Dashboard/CongratulationsPage.robot
Resource  ../../POMs/Dashboard/MojoPlusPopup.robot
Resource  ../../POMs/Dashboard/MerchantDashboard.robot

Test Setup  Open Instamojo
Test Teardown  Close Instamojo
#Test Template  Signup and Payment Onboarding

*** Test Cases ***

Signup and Payment Onboarding

  # Navigate to Login page and click perform signup
  Verify the login page is displayed
  Click signup for free

  Verify the signup page is displayed
  Insert signup username
  Insert signup password
  Click on signup button

  #Enter the mobile number and verify the OTP
  Verify the otp page is displayed
  Enter the mobile number
  Click on send OTP button
  Enter the OTP
  wait until keyword succeeds  20 sec  10 sec   Click on the verify otp button

  #Select the intents
  Verify the intent selection page is displayed
  Select payment intent

  #Select the payment link
  Verify the payment link page is displayed
  Select the 1t suggestion
  Click on the next:business type button

  #Select the business type
  Verify the business type page is displayed
  Select the individual type
  Select proprietor no
  Click on the next:business details button

  #provide the business details
  Verify the business details page is displayed
  Select the business category
  Select the business sub category
  Select the anual turnover
  Select the how old business
  Select the number of employees
  select no website radiobox
  Enter the product or Service in detail
  Click on the next:more business details button

  #provide the more business details
  Verify the more business details page is displayed
  Enter the pan details
  Enter the pan name
  Enter the address
  Select the state
  Enter the pincode
  Select the services
  Click on next:bank details

  #provide the bank details
  Verify the bank details page is displayed
  Enter the Bank account number
  Reenter the bank account number
  Enter the IFSC code
  Click on the create account button

  #congratulation page should display
  Verify the Congratulations page is displayed
  Click on the go to dashboard button

  #The mojoplus popup should be displayed
  Verify MojoPlus popup is displayed
  Click on the skip to dashboard button

  #The merchant dashboard should be opened
  Verify the payment onboarding is successfull









