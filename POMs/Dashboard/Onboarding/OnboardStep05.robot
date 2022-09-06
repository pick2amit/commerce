*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
# Select theme Locators
${SetStoreUrlHeading}  xpath://h2[normalize-space()='Set Store Link']
#//h2[contains(text(),'Set Store URL')]
${StoreUrlInputBox}  xpath://input[@placeholder='E.g. Shah Shoes & Clothes']
#${StoreUrlInputBox}  xpath//*[@id="gmas-main-wrapper"]/div[2]/div/div[2]/div[1]/input
${Suggestion1}  xpath://li[1]//div[1]//label[1]
${Suggestion2}  xpath://li[2]//div[1]//label[1]
${CreateStore}  xpath://button[@class='wizard-btn pull-right']

*** Keywords ***
Enter the store link
    [Arguments]    ${storeLink}
    sleep    1s
    clear element text  ${StoreUrlInputBox}
    input text    ${StoreUrlInputBox}    ${storeLink}
Select 1st url suggestion
    sleep    2s
    Click Element  ${Suggestion1}

CLick on the create store
    sleep    2s
    Click Button  ${CreateStore}

Verify the onboard step05 page is displayed
    wait until element is visible  ${SetStoreUrlHeading}  timeout=10s
    Page should contain element  ${SetStoreUrlHeading}
    Page should contain element  ${StoreUrlInputBox}
    Page should contain element  ${CreateStore}