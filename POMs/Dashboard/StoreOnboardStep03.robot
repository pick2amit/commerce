*** Settings ***

*** Variables ***
${SellingDetailHeading}  xpath://h2[contains(text(),'What are you selling?')]
${PhysicalProduct}  xpath://li[1]//div[1]//label[1]//div[1]
${DigitalProduct}  xpath://p[contains(text(),'Digital Products')]
${Services}  xpath://p[contains(text(),'Services')]
${EventTickets}  xpath://p[contains(text(),'Event Tickets')]
${Others}  xpath://p[contains(text(),'Others')]
${Next:ChooseYourCategory}  xpath://button[@class='wizard-btn pull-right']


*** Keywords ***
Select physical product
    Click Element  ${PhysicalProduct}

CLick on Next Button of Step03
    Click Button  ${Next:ChooseYourCategory}

Verify the onboard step03 page is displayed
  Page should contain element  ${SellingDetailHeading}
  Page should contain element  ${PhysicalProduct}
  Page should contain element  ${Next:ChooseYourCategory}
