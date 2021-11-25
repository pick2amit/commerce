*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# Select theme Locators
${SetStoreUrlHeading}  xpath://h2[normalize-space()='Set Store Link']
#//h2[contains(text(),'Set Store URL')]
${StoreUrlInputBox}  xpath://input[@placeholder='E.g. Shah Shoes & Clothes']
${Suggestion1}  xpath://li[1]//div[1]//label[1]
${Suggestion2}  xpath://li[2]//div[1]//label[1]
${CreateStore}  xpath://button[@class='wizard-btn pull-right']


*** Keywords ***
Select 1st url suggestion
    sleep    2s
    Click Element  ${Suggestion1}

CLick on the create store
    sleep    2s
    Click Button  ${CreateStore}

Verify the onboard step05 page is displayed
    Page should contain element  ${SetStoreUrlHeading}
    Page should contain element  ${StoreUrlInputBox}
    Page should contain element  ${CreateStore}
