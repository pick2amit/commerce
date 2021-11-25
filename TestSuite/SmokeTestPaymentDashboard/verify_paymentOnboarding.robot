*** Settings ***
Documentation  Payment onboarding testcase
Library  SeleniumLibrary
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/SignupPage.robot
Resource  ../../POMs/Dashboard/OtpPage.robot
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/IntentPage.robot
Resource  ../../POMs/Dashboard/PaymentLink.robot
Resource  ../../POMs/Dashboard/BusinessType.robot
Resource  ../../POMs/Dashboard/BusinessDetails.robot
Resource  ../../POMs/Dashboard/MoreBusinessDetails.robot
Resource  ../../POMs/Dashboard/BankDetails.robot
Resource  ../../POMs/Dashboard/CongratulationsPage.robot
Resource  ../../POMs/Dashboard/MojoPlusPopup.robot
Resource  ../../POMs/Dashboard/DashboardPage.robot

Test Setup  Open Instamojo
Test Teardown  Close Instamojo


*** Test Cases ***
Signup and Payment Onboarding
    [Tags]    Smoke
    # Navigate to Login page and click  signup
    LoginPage.Verify The Login Page Is Displayed
    LoginPage.Click signup for free

    # Enter email, password
    SignupPage.Verify the signup page is displayed
    SignupPage.Insert signup username
    SignupPage.Insert signup password
    SignupPage.Click on signup button

    #Enter the mobile number and verify the OTP
    OTPPAGE.Verify the otp page is displayed
    OTPPAGE.Enter the mobile number
    OTPPAGE.Click on send OTP button
    OTPPAGE.Enter the OTP
    wait until keyword succeeds  20 sec  5 sec   OTPPAGE.Click on the verify otp button

    #Select the intents
    IntentPage.Verify the intent selection page is displayed
    IntentPage.Select Payment Intent


    #Select the payment link
    PaymentLink.Verify the payment link page is displayed
    PaymentLink.Select the 1t suggestion
    PaymentLink.Click on the next:business type button

    #Select the business type
    BusinessType.Verify the business type page is displayed
    BusinessType.Select the individual type
    BusinessType.Select proprietor no
    BusinessType.Click on the next:business details button

    #provide the business details
    BusinessDetails.Verify the business details page is displayed
    BusinessDetails.Select the business category
    BusinessDetails.Select the business sub category
    BusinessDetails.Select the anual turnover
    BusinessDetails.Select the how old business
    BusinessDetails.Select the number of employees
    BusinessDetails.select no website radiobox
    BusinessDetails.Enter the product or Service in detail
    BusinessDetails.Click on the next:more business details button

    #provide the more business details
    MoreBusinessDetails.Verify the more business details page is displayed
    MoreBusinessDetails.Enter the pan details
    MoreBusinessDetails.Enter the pan name
    MoreBusinessDetails.Enter the address
    MoreBusinessDetails.Select the state
    MoreBusinessDetails.Enter the pincode
    MoreBusinessDetails.Select the services
    MoreBusinessDetails.Click on next:bank details

    #provide the bank details
    BankDetails.Verify the bank details page is displayed
    BankDetails.Enter the Bank account number
    BankDetails.Reenter the bank account number
    BankDetails.Enter the IFSC code
    BankDetails.Click on the create account button

    #congratulation page should display
    CongratulationsPage.Verify the Congratulations page is displayed
    CongratulationsPage.Click on the go to dashboard button

    #The merchant dashboard should be opened
    DashboardPage.Verify the payment onboarding is successfull