*** Settings ***
Library  SeleniumLibrary
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Store/StoreCheckoutBag.robot
Resource  ../../POMs/Store/StoreCheckoutLogin.robot
Resource  ../../POMs/Store/StoreHomePage.robot
Resource  ../../POMs/Store/StoreCheckoutDelivery.robot
Resource  ../../POMs/Store/StoreProductDetails.robot
Resource  ../../POMs/Store/StoreOrderConfirmation.robot
Resource  ../../POMs/PaymentPages/YourLinkIsReadyPage.robot
Resource  ../../Generic/StoreGeneric.robot


Test Setup  Open online Store
Test Teardown  Close Instamojo
#Test Template  Signup and Payment Onboarding

*** Test Cases ***

Store guest check out
  sleep  5s
  Verify the store footer is displayed