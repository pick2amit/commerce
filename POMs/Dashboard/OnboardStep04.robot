*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# Choose your category. Locators
${ChooseCategoryHeading}  xpath://h2[contains(text(),'Choose your category')]
${ArtCraft&Collectables}  xpath://li[1]//div[1]//label[1]//input[1]
#${Baby}  xpath://li[3]//div[1]//label[1]//input[1]
${Baby}  xpath://input[@value='6']
${Beauty&Fragrance}  xpath://li[4]//div[1]//label[1]//input[1]
${Books&Magazines}  xpath://li[5]//div[1]//label[1]//input[1]
${Next:CustomizeYourStore}  xpath://button[@class='wizard-btn pull-right']

*** Keywords ***
Select category
    Click Element  ${Baby}

CLick on Next Button of Step04
    Click Button  ${Next:CustomizeYourStore}

Verify the onboard step04 page is displayed
  Page should contain element  ${ChooseCategoryHeading}
  Page should contain element  ${Baby}
  Page should contain element  ${Next:CustomizeYourStore}