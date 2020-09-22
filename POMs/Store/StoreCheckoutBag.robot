*** Settings ***


*** Variables ***
${MakePaymentButton}  xpath://button[@class='theme-btn theme-btn-solid proceed-payment-btn btn-block hidden-xs ng-scope']

*** Keywords ***

Click on make payment button
   Click Element  ${MakePaymentButton}
