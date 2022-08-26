*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${GetStartedWithIMtext}  xpath://h3[@class='flush--top']
${Payments}  xpath://div[contains(@class,'delta')][contains(text(),'Payments')]
${FreeOnlineStore}  xpath://div[contains(text(),'Free Online Store')]

*** Keywords ***
Select payment intent
   sleep  2s
   Click Element  ${Payments}

Select store intent
   sleep  2s
   Click Element  ${FreeOnlineStore}

Verify the intent selection page is displayed
   Page Should Contain Element  ${Payments}
   Page Should Contain Element  ${FreeOnlineStore}