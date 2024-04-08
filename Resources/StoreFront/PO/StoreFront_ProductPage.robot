*** Settings ***
Library    SeleniumLibrary
Resource    ./StoreFront_TopNav.robot

*** Variables ***
${BUY_NOW_BTN}          xpath://*[@id="buy-now-btn"]
${ADD_TO_CART_BTN}      xpath://*[@id="add-to-cart-btn"]
${NOTIFIER}             xpath://*[@id="root"]/div[3]/div[2]/div/div/div/div
${FILE_UPLOAD_BTN}      xpath://input[contains(@id,"-Message with file")]
#${FILE_UPLOAD_BTN}      CSS:input[id$="Message with file"]


*** Keywords ***
go to specific product page
    [Arguments]     ${PAGE_URL}
    go to           ${PAGE_URL}

check for the BuyNow Btn
    wait until page contains element    ${BUY_NOW_BTN}

check for the add to cart Btn
    wait until page contains element    ${ADD_TO_CART_BTN}

add product to cart
    wait until element is enabled       ${ADD_TO_CART_BTN}
    #click below the logo link to remove the product zoom image, CTA btn overlap issue
    click element at coordinates        ${LOGO_LINK}        0    70
    click element                       ${ADD_TO_CART_BTN}
    sleep    1s
    #click element at coordinates        ${NOTIFIER}         190   0

select file to upload
    [Arguments]                         ${FILE_LOCATION}
    wait until page contains element    ${FILE_UPLOAD_BTN}
    #click below the logo link to remove the product zoom image CTA btn overlap issue
    click element at coordinates        ${LOGO_LINK}        0    80
    wait until element is enabled       ${FILE_UPLOAD_BTN}
    choose file                         ${FILE_UPLOAD_BTN}      ${FILE_LOCATION}
