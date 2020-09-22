*** Settings ***

*** Variables ***
# Select theme Locators
${SetStoreUrlHeading}  xpath://h2[contains(text(),'Set Store URL')]
${StoreUrlInputBox}  xpath://input[@placeholder='E.g. Shah Shoes & Clothes']
${Suggestion1}  xpath://li[1]//div[1]//label[1]
${Suggestion2}  xpath://li[2]//div[1]//label[1]
${CreateStore}  xpath://button[@class='wizard-btn pull-right']


*** Keywords ***
Select 1st url suggestion
    Click Element  ${Suggestion1}

CLick on the create store
    Click Button  ${CreateStore}

Verify the onboard step06 page is displayed
  Page should contain element  ${SetStoreUrlHeading}
  Page should contain element  ${StoreUrlInputBox}
  Page should contain element  ${CreateStore}
