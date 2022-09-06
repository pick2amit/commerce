*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${StoreNameHeading}  xpath://h2[contains(text(),"What's the name of your store?")]
${StoreNameInputBox}  xpath://input[@placeholder='Example : My Store Name']
${Next:AddSocialLink}  xpath://button[@class='wizard-btn']

*** Keywords ***
Enter Store Name
    [Arguments]    ${storeName}
    wait until element is visible  ${StoreNameInputBox}  timeout=10s
    PRESS KEYS    ${StoreNameInputBox}  ${storeName}

Click on Next Button of Step01
    Click Button  ${Next:AddSocialLink}

Verify the onboard step01 page is displayed
  wait until element is visible  ${StoreNameInputBox}  timeout=10s
  Page should contain element  ${StoreNameHeading}
  Page should contain element  ${StoreNameInputBox}
  Page should contain element  ${Next:AddSocialLink}