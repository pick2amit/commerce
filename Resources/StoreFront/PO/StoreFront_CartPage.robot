*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${CART_HEADING}              xpath://*[@id="cart-heading"]
${ORDER_SUMMARY_HEADING}     xpath://*[@id="root"]/div[3]/div/div[3]/div/div[2]/span
${CHECKOUT_BTN}              xpath://*[@id="root"]/div[3]/div/div[3]/div/div[2]/div/button
${COUPON_CODE_INPUT}         xpath://*[@id="coupon-code-input"]
${APPLY_COUPON_BTN}          xpath://*[@id="apply-coupon"]
${REMOVE_PRODUCT_BTN}        xpath://*[@id="cart-item-delete-1"]

*** Keywords ***
page should load successfully
    wait until page contains element    ${CART_HEADING}

proceed to checkout
    element should be enabled       ${CHECKOUT_BTN}
    click element                   ${CHECKOUT_BTN}