*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# Store setup finish page Locators
${StoreLogo}    xpath://img[@class='store-img']
${YourOnlineStoreReadyHeading}  xpath://h3[contains(text(),'Your online store is ready!')]
#${SetupPaymentLink}  xpath://a[contains(text(),'Set up Payments')]
${StoreLink}  xpath://a[@class='wizard-btn']


*** Keywords ***
Verify the onboard finish page is displayed
    Page should contain element  ${StoreLogo}
    Page should contain element  ${YourOnlineStoreReadyHeading}
    Page should contain element  ${StoreLink}
