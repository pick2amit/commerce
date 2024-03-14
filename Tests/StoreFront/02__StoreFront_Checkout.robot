*** Settings ***
Documentation    Guest user checkout flow testing
Resource   ../../Resources/Common/CommonWeb.robot
Resource   ../../Resources/StoreFront/StoreFrontApp.robot
#Test Setup      Start web test
#Test Teardown   End web test
Suite Setup       Start web test
Suite Teardown    End web test
*** Variables ***
${STOREFRONT_URL} =   https://amit-kt501.myinstamojo.com/
${BROWSER} =          chrome

*** Test Cases ***
Open the store's home page
    [Tags]    Smoke
    StoreFrontApp.Open the homepage
    StoreFrontApp.Verify the page is loaded

Open the 1st product in product showcase
    [Tags]    Smoke
    StoreFrontApp.Verify the navigation to prduct detail page

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