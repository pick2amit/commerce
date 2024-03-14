*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BUY_NOW_BTN}          xpath://*[@id="buy-now-btn"]
${ADD_TO_CART_BTN}      xpath://*[@id="add-to-cart-btn"]
${NOTIFIER}             xpath://*[@id="root"]/div[3]/div[2]/div/div/div/div
#                             //*[@id="root"]/div[3]/div[2]/div/div/div/div

*** Keywords ***
check for the BuyNow Btn
    wait until page contains element    ${BUY_NOW_BTN}

check for the add to cart Btn
    wait until page contains element    ${ADD_TO_CART_BTN}

add product to cart
    wait until element is enabled       ${ADD_TO_CART_BTN}
    click element                       ${ADD_TO_CART_BTN}
    sleep    1s
    click element at coordinates        ${NOTIFIER}     190   0