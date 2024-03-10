*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${PaymentLinkTextBox}  xpath://span[@id='shorturl']
${PNameTextBox}  xpath://li[1]//div[2]//input[1]
${PEmailTextBox}  xpath://li[2]//div[2]//input[1]
${MobileNoTextBox}  xpath://input[@class='rrui__input rrui__input-field react-phone-number-input__phone']
${Next}  xpath://button[contains(@class,'btn-green btn-block btn--stateful')]
${CreditCard}  xpath://div[@class='row flush--sides']//li[1]//a[1]
${iframe}  xpath://iframe[@class='animate-iframe--max-height']
${CardNumber}  xpath://*[@id="card-number"]
${ExpiryMonth}  xpath://*[@id="card-expiry-month"]
${ExpiryYear}  xpath://*[@id="card-expiry-year"]
${CVV}  xpath://*[@id="card-cvv"]
${PayButton}  xpath://*[@id="submit-form-button"]
${EnterPassword}  xpath://input[@id='txtPassword']
${SubmitButton}  xpath://input[@id='cmdSubmit']
${PaymentSuccessfull}  xpath://h3[@class='text-green font-rc']

*** Keywords ***
Click reload if the page not opened
  Reload Page
  Handle Alert  action=ACCEPT
  sleep  10s
  Page Should Contain Element  ${EnterPassword}

Copy the link and enter the user details
  [Arguments]  ${PaymentCompBrowser}  ${PayerUserName}  ${PayerEmailId}  ${PayerMobileNo}
  ${URL}=  Get Text  ${PaymentLinkTextBox}
  log to console  ${URL}
  Open Browser   ${URL}  ${PaymentCompBrowser}
  Maximize Browser Window
  sleep  2s
  Input Text  ${PNameTextBox}  ${PayerUserName}
  Input Text  ${PEmailTextBox}  ${PayerEmailId}
  Input Text  ${MobileNoTextBox}  ${PayerMobileNo}
  Click Element  ${Next}
  sleep  5s

Select credit card option and make payment
  Click Element  ${CreditCard}
  sleep  2s
  Select Frame  ${iframe}
  Input Text  ${CardNumber}  4242424242424242
  sleep  2s
  Input Text  ${ExpiryMonth}  01
  sleep  2s
  Input Text  ${ExpiryYear}  22
  sleep  2s
  Input Text  ${CVV}  111
  sleep  2s
  Click Element  ${PayButton}
  sleep  10s
  Unselect Frame
  @{WindowHandles}=  Get Window Handles
  sleep  4s
  Switch Window  @{WindowHandles}[1]
  sleep  4s
  wait until keyword succeeds  20 sec  10 sec   Click reload if the page not opened
  Input Text  ${EnterPassword}  1221
  sleep  2s
  Click Element  ${SubmitButton}
  sleep  3s
  Switch Window  @{WindowHandles}[0]
  sleep  2s

Verify the payment is done succesfullly
  Page Should Contain Element  ${PaymentSuccessfull}