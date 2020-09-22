*** Settings ***

*** Variables ***
# Select theme Locators
${CustomizeStoreHeading}  xpath://h2[contains(text(),'Customize your store')]
${SelectShell}  xpath://p[contains(text(),'Shell')]
${SelectMonograph}  xpath://p[contains(text(),'Monograph')]
${SelectDecoration}  xpath://p[contains(text(),'Decoration')]
${SelectSimplar}  xpath://p[contains(text(),'Simplar')]
${Next:SetStoreUrl}  xpath://button[@class='wizard-btn pull-right']


*** Keywords ***
Select theme
    Click Element  ${SelectShell}

CLick on Next Button of Step05
    Click Button  ${Next:SetStoreUrl}

Verify the onboard step05 page is displayed
  Page should contain element  ${CustomizeStoreHeading}
  Page should contain element  ${SelectShell}
  Page should contain element  ${Next:SetStoreUrl}
