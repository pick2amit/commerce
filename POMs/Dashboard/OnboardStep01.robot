*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${StoreNameHeading}  xpath://h2[contains(text(),"What's the name of your store?")]
${StoreNameInputBox}  xpath://input[@placeholder='Example : My Store Name']
${Next:AddSocialLink}  xpath://button[@class='wizard-btn']


*** Keywords ***
Enter Store Name
    sleep  2s
    Input Text  ${StoreNameInputBox}  akt01

Click on Next Button of Step01
    Click Button  ${Next:AddSocialLink}

Verify the onboard step01 page is displayed
  Page should contain element  ${StoreNameHeading}
  Page should contain element  ${StoreNameInputBox}
  Page should contain element  ${Next:AddSocialLink}
