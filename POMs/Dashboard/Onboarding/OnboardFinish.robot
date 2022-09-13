*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
# Store setup finish page Locators
#${StoreLogo}    xpath://img[@class='store-img']
#${YourOnlineStoreReadyHeading}  xpath://h3[contains(text(),'Your online store is ready!')]
#${SetupPaymentLink}  xpath://a[contains(text(),'Set up Payments')]
#${StoreLink}  xpath://a[@class='wizard-btn']

${OnboardSuccessLogo}    xpath://img[@alt='Onboard success!']
${Congrats}    xpath://h2[normalize-space()='Congratulations!']
${SetupYourOnlineStore}  xpath://a[normalize-space()='Setup Your Online Store']

*** Keywords ***
Verify the onboard finish page is displayed
    wait until element is visible  ${OnboardSuccessLogo}    timeout=20s
    Page should contain element  ${OnboardSuccessLogo}
    Page should contain element  ${Congrats}
    Page should contain element  ${SetupYourOnlineStore}