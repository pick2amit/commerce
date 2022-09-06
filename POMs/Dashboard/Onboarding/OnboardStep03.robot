*** Settings ***
Library  SeleniumLibrary

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

Select digital product
    Click Element    ${DigitalProduct}

Select services
    Click Element  ${Services}

Select event tickets
    Click Element   ${EventTickets}}

Select others
    Click Element    ${Others}

CLick on Next Button of Step03
    Click Button  ${Next:ChooseYourCategory}

Verify the onboard step03 page is displayed
    wait until element is visible  ${SellingDetailHeading}  timeout=10s
    Page should contain element  ${SellingDetailHeading}
    Page should contain element  ${PhysicalProduct}
    Page should contain element  ${Next:ChooseYourCategory}