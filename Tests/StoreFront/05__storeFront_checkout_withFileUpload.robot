*** Settings ***
Documentation    Guest user checkout flow testing
Resource   ../../Resources/Common/CommonWeb.robot
Resource   ../../Resources/StoreFront/StoreFrontApp.robot

Suite Setup       Start web test
Suite Teardown    End web test

*** Variables ***
${PAGE_URL} =         https://amit-kt501.myinstamojo.com/product/5162216/mango-hai-ye-mango-dont-miss
${BROWSER} =          chrome
${FILE_LOCATION} =    ${EXECDIR}/DataManager/dusk.png

*** Test Cases ***
Open the store's product page
    [Tags]    Smoke
    StoreFrontApp.open the product page     ${PAGE_URL}
    StoreFrontApp.Verify the page is loaded
    StoreFrontApp.choose the file to upload     ${FILE_LOCATION}


Add product to the cart
    [Tags]    Smoke
    StoreFrontApp.add product to cart form the product page



Open the cart and proceed to checkout
    [Tags]    Smoke
    StoreFrontApp.open the cart page form header

Add customer info
    [Tags]    Smoke
    StoreFrontApp.start the checkout

Add shipping delivery address
    [Tags]    Smoke
    StoreFrontApp.fill the delivery details and proceed

Make Payment
    [Tags]    Smoke
    StoreFrontApp.close the payment popup