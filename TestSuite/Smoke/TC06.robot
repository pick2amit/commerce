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


Test Setup  Open online Store
Test Teardown  Close Instamojo
#Test Template  Signup and Payment Onboarding

*** Test Cases ***

Store guest check out
   Seacrh product in store
   Select the first searched product
   Click on buy now button
   Click on continue as guest button
   Enter the delivery details  Vishal  Patil  testac@gmail.com  9988776666  belguam  testtesttest  105  16  591254
   Click on continue to Bag
   Click on make payment button
   Select credit card option and make payment
   Verify the physical product succesfully orderd

