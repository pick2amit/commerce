*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${imbLogo}  xpath://picture[@title='instamojo_logo']//img
${mojoStarLogo}  xpath:(//img[contains(@class,'mojostarlogo')])[1]
${loginBtn}  xpath:(//a[contains(@href,'#')][normalize-space()='Log In'])[1]
${signupBtn}  xpath:(//a[contains(@href,'#')][normalize-space()='Sign Up'])[1]
${pricingPageLink}  xpath://ul[@id='menu-uber-pri-menu']//a[normalize-space()='Pricing']

*** Keywords ***
Open login page
    wait until element is enabled    ${loginBtn}    timeout=30s
    click element    ${loginBtn}
Verify the homepage
    wait until page contains element    ${mojoStarLogo}    timeout=30s
    page should contain element    ${imbLogo}
    page should contain element    ${mojoStarLogo}
    page should contain element    ${loginBtn}
    page should contain element    ${signupBtn}
    page should contain element    ${pricingPageLink}