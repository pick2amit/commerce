*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${LOGO_LINK}        xpath://*[@id="9024151"]/div[1]/a/img
${HOME_LINK}        xpath://*[@id="header-home"]
${SHOP_LINK}        xpath://*[@id="header-shop-all"]
${ABOUTUS_LINK}     xpath://*[@id="header-about-us"]
${CONTACTUS_LINK}   xpath://*[@id="header-contact-us"]
${FAQS_LINK}        xpath://*[@id="header-faqs"]
${HUMBERGER_MENU}   xpath://*[@id="9024151"]/div[1]/div[1]/div/div[1]/div/div[6]/div/a/img
${SEARCH_ICON}      xpath://*[@id="9024151"]/div[1]/div[2]/div[1]/div/img
${USER_ICON}        xpath://*[@id="9024151"]/div[1]/div[2]/div[2]/a/img
${CART_LINK}        xpath://a[@href="/cart"]/div

*** Keywords ***
Open the cart page
    wait until page contains element    ${CART_LINK}
    click element                       ${CART_LINK}
    sleep    3s

Open the login page
    wait until page contains element    ${USER_ICON}
    click element                       ${USER_ICON}
    sleep    2s