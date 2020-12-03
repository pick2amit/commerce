*** Settings ***
Library  SeleniumLibrary
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../Generic/StoreGeneric.robot
Resource  ../../POMs/Store/StoreLoginPage.robot


Test Setup  Open online Store
Test Teardown  Close Instamojo
#Test Template  Signup and Payment Onboarding

*** Test Cases ***
Verify the store with valid cred
  Click on the login button from store
  Enter username
  Enter password
  sleep  2s
  Click on the submit button
  sleep  2s
  Verify valid login

