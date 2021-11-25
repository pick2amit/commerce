*** Settings ***
Documentation    Suite description
Library  DataDriver  file=../../DataDriven/PaymentLinkDetails.xlsx  sheet_name=Sheet1
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/PaymentPages/CreatePaymentLink.robot
Resource  ../../POMs/Dashboard/MerchantDashboard.robot
Resource  ../../POMs/PaymentPages/YourLinkIsReadyPage.robot

Test Setup  Open Instamojo
Test Teardown  Close Instamojo
Test Template  Create payment link and make payment

*** Test Cases ***
Create the payment link and make payment using credit card  ${username}  ${password}  ${PaymentCompBrowser}  ${PayerUserName}  ${PayerEmailId}  ${PayerMobileNo}
*** Keywords ***
Create payment link and make payment
  [Arguments]  ${username}  ${password}  ${purposeofpayment}  ${amount}  ${PaymentCompBrowser}  ${PayerUserName}  ${PayerEmailId}  ${PayerMobileNo}
  Insert login username  ${username}
  Insert login password  ${password}
  Click login button
  Click on the create link button
  Enter the purpuse of payment  ${purposeofpayment}
  Enter the amount  ${amount}
  Click on the create button
  sleep  5s
  Copy the link and enter the user details  ${PaymentCompBrowser}  ${PayerUserName}  ${PayerEmailId}  ${PayerMobileNo}
  Select credit card option and make payment
  Verify the payment is done succesfullly













