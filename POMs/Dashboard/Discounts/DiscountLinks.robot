*** Settings ***
Library  SeleniumLibrary
Library    String
*** Variables ***
${DiscountLinksHeading}    xpath://h1[normalize-space()='Discount Links']

${GenerateLinkHeading}    xpath://h3[normalize-space()='Generate a Discount Link']
${CodeIPBox}    xpath://input[@name='promo_code']
${AmountIPBox}    xpath://input[@name='flat_discount']
${QuantityIPBox}    xpath://input[@name='frequency_allowed']
${GenerateLinkBtn}    xpath://button[normalize-space()='Generate link']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']
${LinkMenu}    xpath:(//td/div/div/div)
${DeleteLink}    xpath://td/div/div[2]/div/div[3]

*** Keywords ***
Verify discount link page
    wait until element is visible    ${DiscountLinksHeading}    timeout=25s
    page should contain element   ${DiscountLinksHeading}
    page should contain element    ${GenerateLinkBtn}

Verify delete link
    wait until element is visible    ${ToastMsg}    timeout=15s
    page should contain element  ${ToastMsg}

Get discount code text
    sleep    2s
    ${couponCode}=    get text    xpath://tr[1]/td[1]
    log    Code from the List: ${couponCode}
    RETURN    ${couponCode}

Delete discount link
    [Arguments]    ${index}
    ${FirstLinkMenu}=    set variable    ${LinkMenu}\[${index}]
    log    LinkMenu: ${LinkMenu}
    log    1stLinkMenu: ${FirstLinkMenu}
    wait until element is visible    ${FirstLinkMenu}    timeout=20s
    click element  ${FirstLinkMenu}
    sleep    1s
    click element    ${DeleteLink}
    handle alert    action=accept   timeout=10s

Add discount link
    [Arguments]    ${DiscountCode}    ${AmountOff}    ${Frequency}    ${Product}
    ${Random} =  Generate Random String  10  [LOWER]
    ${DiscountCodeName} =    Set Variable  ${DiscountCode}${Random}
    input text    ${CodeIPBox}    ${DiscountCodeName}
    input text    ${AmountIPBox}    ${AmountOff}
    input text    ${QuantityIPBox}    ${Frequency}
    input text    xpath://li/div/div/div/div/div/div/input    ${Product}
    #input text    xpath://li/div/div/div/div[normalize-space()='Select...']    ${Product}
    sleep    2s
    click element at coordinates    xpath://li/div/div/div/div/div/div/input    0    50
    # 28 to 64 1st element
    click element    ${GenerateLinkBtn}
    wait until element is not visible    ${ToastMsg}    timeout=15s
    log    Added Discount Code: ${DiscountCodeName}
    RETURN    ${DiscountCodeName}