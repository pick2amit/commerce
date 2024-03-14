*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CART_LINK}    xpath://a[@href="/cart"]/div

*** Keywords ***
Open the cart page
    wait until page contains element    ${CART_LINK}
    click element                       ${CART_LINK}
    sleep    3s