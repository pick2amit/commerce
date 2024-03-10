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