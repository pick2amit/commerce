*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Store/HomePage.robot
Resource  ../../POMs/Store/ProductPage.robot
Resource  ../../POMs/Store/CheckoutPage.robot

Test Setup    Open Store
Test Teardown    Close Instamojo

*** Test Cases ***
Verify guest user checkoutv
    [Tags]    Smoke
    HomePage.Verify homepage elements
    HomePage.Open the 1st featured product

    ProductPage.Add Product To Cart
    ProductPage.Open The Cart
    ProductPage.Proceed To Checkout

    Checkoutpage.Verify Customer Info Heading
    Checkoutpage.Enter First Name
    Checkoutpage.Enter Last Name
    Checkoutpage.Enter Email
    Checkoutpage.Enter Mobile No
    Checkoutpage.Click On The Add Delivery Info Btn

    Checkoutpage.Verify Shipping Heading
    Checkoutpage.Enter Shipping Address
    Checkoutpage.Enter Shipping City
    Checkoutpage.Enter Shipping Pincode
    Checkoutpage.Enter Shipping State
    Checkoutpage.Click On The Review And Pay

    Checkoutpage.Verify Review Order Heading
    Checkoutpage.Increase Product Quantity
    Checkoutpage.Decrease Product Quantity
    Checkoutpage.Click On The Make Payment
    CheckoutPage.Verify That Payment Popup Opens
    #CheckoutPage.Close Payment Popup