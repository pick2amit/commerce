*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BUY_NOW_BTN}     xpath://*[@id="buy-now-btn"]

*** Keywords ***
check for the BuyNow Btn
    wait until page contains element    ${BUY_NOW_BTN}