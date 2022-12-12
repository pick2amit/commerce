*** Settings ***
Library  SeleniumLibrary    timeout=2s

*** Variables ***
${OrderIDHeading}    xpath://h1[contains(.,'Order ID: ')]
${OrderDetailHeading}    xpath://h5[normalize-space()='ORDER DETAILS']
${PaymentHeading}    xpath://h5[normalize-space()='PAYMENT DETAILS']
${BuyerHeading}    xpath://h5[contains(.,'BUYER DETAILS')]


*** Keywords ***
Verify order details
    wait until element is visible    ${OrderIDHeading}    timeout=30s
    page should contain element        ${OrderIDHeading}
    page should contain element    ${OrderDetailHeading}
    page should contain element    ${PaymentHeading}
    page should contain element    ${BuyerHeading}

