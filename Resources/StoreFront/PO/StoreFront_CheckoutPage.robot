*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CUSTOMER_INFO_HEADING}         xpath://h1[normalize-space()='Customer Information']
${FIRST_NAME_INPUT}              xpath://input[@id='firstname']
${LAST_NAME_INPUT}               xpath://input[@id='lastname']
${EMAIL_INPUT}                   xpath://input[@id='email']
${MOBILE_NO_INPUT}               xpath://input[@placeholder='Mobile No.']
${WHATSAPP_CHECKBOX}             xpath://*[@id="send_whatsapp_communication"]
${COUPON_INPUT}                  xpath://input[@placeholder='Enter Coupon/Discount Code']
${COUPON_APPLY_BUTTON}           xpath://button[normalize-space()='Apply']
${ADD_DELIVERY_INFO_BUTTON}      xpath://button[normalize-space()='Add Delivery Info']

${SHIPPING_ADDRESS_HEADING}      xpath://h1[normalize-space()='Shipping Address']
${HOUSE_NO_INPUT}                xpath://input[@id='address']
${CITY_INPUT}                    xpath://input[@id='city']
${PINCODE_INPUT}                 xpath://input[@id='code']
${STATE_LIST}                    xpath://select[@id='state']
${BILLING_ADDRESS_CHECKBOX}      xpath://input[@id='same_as_shipping_address']
${REVIEW_ORDER_BUTTON}           xpath://button[@id='submit']

${REVIEW_ORDER_HEADING}          xpath://h1[normalize-space()='Review Your Order']
${SELECT_PAYMENT_BUTTON}         xpath://button[normalize-space()='Select Payment']
${SELECT_PAYMENT_HEADING}        xpath://h1[normalize-space()='Select Payment Options']
${PAYMENT_RADIO_BUTTON_GROUP}    payment-option
${ONLINE_PAY_BUTTON_VALUE}       Instamojo
${COD_BUTTON_VALUE}              xpath://*[@value="Cash-On-Delivery"]
${PLACE_ORDER_BUTTON}            xpath://button[normalize-space()='Place Order']

${IFRAME_CLOSE_BUTTON}     xpath://*[@id="root"]/div[3]/div[1]/div[1]/div/div/button


*** Keywords ***
Fill the customer info
    wait until page contains element    ${CUSTOMER_INFO_HEADING}
    input text                          ${FIRST_NAME_INPUT}     amit
    input text                          ${LAST_NAME_INPUT}      tewari
    input text                          ${EMAIL_INPUT}          amit@test.com
    input text                          ${MOBILE_NO_INPUT}      9999888888
    select checkbox                     ${WHATSAPP_CHECKBOX}
    click element                       ${ADD_DELIVERY_INFO_BUTTON}
    sleep                               2s

Fill the shipping address
    wait until page contains element    ${SHIPPING_ADDRESS_HEADING}
    input text                          ${HOUSE_NO_INPUT}           12345
    input text                          ${CITY_INPUT}               Lucknow
    input text                          ${PINCODE_INPUT}            201301
    select from list by value           ${STATE_LIST}               IN-UP
    select checkbox                     ${BILLING_ADDRESS_CHECKBOX}
    click element                       ${REVIEW_ORDER_BUTTON}

select the payment option
    wait until page contains element   ${REVIEW_ORDER_HEADING}
    click element                      ${SELECT_PAYMENT_BUTTON}

    wait until page contains element    ${SELECT_PAYMENT_HEADING}
    select radio button                 ${PAYMENT_RADIO_BUTTON_GROUP}   Instamojo
    click element                       ${PLACE_ORDER_BUTTON}

switch to iframe and close it
    wait until page contains element    xpath=//iframe
    #select frame    xpath=//iframe
    wait until page contains element    ${IFRAME_CLOSE_BUTTON}
    click element                       ${IFRAME_CLOSE_BUTTON}