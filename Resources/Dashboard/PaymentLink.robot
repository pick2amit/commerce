*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${PaymentLinkPlaceHolder}  xpath://h3[@class='soft--bottom text-grey flush']
${PaymentLinkUNTextField}  xpath://input[@placeholder='username']
${PLSuggestion1}  xpath://section[contains(@class,'columns small-12')]//li[1]
${Next:BusinessType}  xpath://input[contains(@class,'btn-green btn-block')]

*** Keywords ***
Select the 1t suggestion
  Click Element  ${PLSuggestion1}

Click on the next:business type button
  Click Element  ${Next:BusinessType}

Verify the payment link page is displayed
  Page should contain element  ${PaymentLinkPlaceHolder}
  Page should contain element  ${PLSuggestion1}
  Page should contain element  ${Next:BusinessType}