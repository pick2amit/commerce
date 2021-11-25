*** Settings ***
Documentation  Store onboarding testcase
Library  SeleniumLibrary
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/SignupPage.robot
Resource  ../../POMs/Dashboard/OtpPage.robot
Resource  ../../POMs/Dashboard/IntentPage.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/OnboardStep01.robot
Resource  ../../POMs/Dashboard/OnboardStep02.robot
Resource  ../../POMs/Dashboard/OnboardStep03.robot
Resource  ../../POMs/Dashboard/OnboardStep04.robot
Resource  ../../POMs/Dashboard/OnboardStep05.robot
Resource  ../../POMs/Dashboard/OnboardFinish.robot

Test Setup  Open Instamojo
Test Teardown  Close Instamojo

*** Test Cases ***
Store onboarding signup

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
    wait until keyword succeeds  20 sec  5 sec   Click on the verify otp button

    #Select the Store intents
    IntentPage.Verify the intent selection page is displayed
    IntentPage.select store intent

    # Onboard STEP-01 Enter the Store name
    OnboardStep01.Enter Store Name
    OnboardStep01.Click On Next Button Of Step01

    # Onboard STEP-02 Enter social media details
    OnboardStep02.Verify The Onboard Step02 Page Is Displayed
    OnboardStep02.Enter Insta Username
    OnboardStep02.Enter FB Page
    OnboardStep02.Enter Youtube Channel
    OnboardStep02.Enter Website
    OnboardStep02.Click On Next Button Of Step02

    # Onboard STEP-03 Select the product type
    OnboardStep03.Verify The Onboard Step03 Page Is Displayed
    OnboardStep03.Select Physical Product
    OnboardStep03.CLick on Next Button of Step03

    # Onboard STEP-04 Select Business category
    OnboardStep04.Verify The Onboard Step04 Page Is Displayed
    OnboardStep04.Select Category
    OnboardStep04.CLick on Next Button of Step04

    #Onboard STEP-05 Select the Store URL
    OnboardStep05.Verify The Onboard Step05 Page Is Displayed
    OnboardStep05.Select 1st Url Suggestion
    OnboardStep05.CLick On The Create Store

    # verify the Final page
    OnboardFinish.Verify The Onboard Finish Page Is Displayed