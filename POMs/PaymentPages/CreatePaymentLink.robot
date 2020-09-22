*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${PurposeOfPaymentTextBox}  xpath://input[@placeholder='What is this payment for?']
${AmountTextBox}  xpath://input[@placeholder='Enter the amount']
${CreateButton}  xpath://input[@class='btn-green btn-block']

*** Keywords ***

Enter the purpuse of payment
  [Arguments]  ${purposeofpayment}
  Input Text  ${PurposeOfPaymentTextBox}  ${purposeofpayment}
  sleep  2s


Enter the amount
  [Arguments]  ${amount}
  Input Text  ${AmountTextBox}  ${amount}
  sleep  2s

Click on the create button
  Click Element  ${CreateButton}
  sleep  5s

