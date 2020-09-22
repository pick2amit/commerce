*** Settings ***
Documentation    Commerce intent merchant signup

Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/SignupPage.robot
Resource  ../../POMs/Dashboard/OtpPage.robot
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/SelectIntent.robot
Resource  ../../POMs/Dashboard/StoreOnboardStep01.robot
Resource  ../../POMs/Dashboard/StoreOnboardStep02.robot
Resource  ../../POMs/Dashboard/StoreOnboardStep03.robot
Resource  ../../POMs/Dashboard/StoreOnboardStep04.robot
Resource  ../../POMs/Dashboard/StoreOnboardStep05.robot
Resource  ../../POMs/Dashboard/StoreOnboardStep06.robot
Resource  ../../POMs/Dashboard/StoreOnboardFinish.robot


Test Setup  Open Instamojo
Test Teardown  Close Instamojo


*** Keywords ***

*** Test Cases ***
Commerce User Signup
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
    wait until keyword succeeds  28 sec  4 sec   Click on the verify otp button

    #Select the Store intents
    Verify the intent selection page is displayed
    Select store intent

    #Onboard step01, Store name
    sleep  10s
    Verify the onboard step01 page is displayed
    Enter Store Name
    sleep  5s
    Click on Next Button of Step01

    #Onboard step02, Social link
    sleep  5s
    Verify the onboard step02 page is displayed
    Enter insta username
    Enter FB page
    Enter Youtube channel
    Enter Website
    Click on Next Button of Step02

    #Onboard step03, Selling detail/Product type
    sleep  4s
    Verify the onboard step03 page is displayed
    Select physical product
    CLick on Next Button of Step03

    #Onboard step04, Select Category
    sleep  4s
    Verify the onboard step04 page is displayed
    Select category
    CLick on Next Button of Step04

    #Onboard step05, Select theme
    sleep  4s
    Verify the onboard step05 page is displayed
    Select theme
    CLick on Next Button of Step05

    #Onboard step06, Set Store URL
    sleep  4s
    Verify the onboard step06 page is displayed
    Select 1st url suggestion
    CLick on the create store


    #Onboard confirmation step
    sleep  4s
    Verify the onboard finish page is displayed










