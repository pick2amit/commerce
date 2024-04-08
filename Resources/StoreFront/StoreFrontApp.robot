*** Settings ***
Resource    ./PO/StoreFront_CartPage.robot
Resource    ./PO/StoreFront_CheckoutPage.robot
Resource    ./PO/StoreFront_HomePage.robot
Resource    ./PO/StoreFront_LoginPage.robot
Resource    ./PO/StoreFront_OrderConfirmationPage.robot
Resource    ./PO/StoreFront_ProductPage.robot
Resource    ./PO/StoreFront_TopNav.robot

*** Variables ***

*** Keywords ***
Open the homepage
    StoreFront_HomePage.Navigate to the homepage

Verify the page is loaded
    StoreFront_HomePage.check for the store logo

Verify the homepage title
    StoreFront_HomePage.match the page title

Verify the homepage banner
    StoreFront_HomePage.check for the banner

Verify the product showcase
    StoreFront_HomePage.check for the product showcase

Verify the navigation to prduct detail page
    StoreFront_HomePage.scroll to 1st product in list
    StoreFront_HomePage.open 1st produt in the list
    StoreFront_ProductPage.check for the BuyNow Btn

open the cart page form header
    StoreFront_TopNav.Open the cart page

start the checkout
    StoreFront_CartPage.page should load successfully
    StoreFront_CartPage.proceed to checkout

fill the delivery details and proceed
    StoreFront_CheckoutPage.Fill the customer info
    StoreFront_CheckoutPage.Fill the shipping address
    StoreFront_CheckoutPage.select the payment option

close the payment popup
    StoreFront_CheckoutPage.switch to iframe and close it

login on the store with valid credentials
    [Arguments]    ${USER_EMAIL}    ${USER_PASSWORD}
    StoreFront_TopNav.Open the login page
    StoreFront_LoginPage.Enter user email       ${USER_EMAIL}
    StoreFront_LoginPage.Enter password         ${USER_PASSWORD}
    StoreFront_LoginPage.Click on login button
    StoreFront_LoginPage.Verify valid login

login on the store with Invalid credentials
    [Arguments]    ${USER_EMAIL}    ${USER_PASSWORD}    ${ERROR_MESSAGE}    ${ERROR_TYPE}
    Open the homepage
    StoreFront_TopNav.Open the login page
    StoreFront_LoginPage.Enter user email            ${USER_EMAIL}
    StoreFront_LoginPage.Enter password              ${USER_PASSWORD}
    StoreFront_LoginPage.Click on login button
    StoreFront_LoginPage.Verify invalid login error  ${ERROR_TYPE}

#Product page operations
add product to cart form the product page
    StoreFront_ProductPage.check for the add to cart Btn
    StoreFront_ProductPage.add product to cart

open the product page
    [Arguments]                                           ${PAGE_URL}
    StoreFront_ProductPage.go to specific product page    ${PAGE_URL}

choose the file to upload
    [Arguments]                                     ${FILE_LOCATION}
    StoreFront_ProductPage.select file to upload    ${FILE_LOCATION}

