*** Settings ***
Documentation  Add Product
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot
Resource  ../../POMs/Dashboard/Products/AddProductPage.robot
#Resource  ../../POMs/Dashboard/Products/AddProductPage.robot
Test Setup  Open Instamojo    ${Browser}
Test Teardown  Close Instamojo

*** Test Cases ***
Add a physical product
    LoginPage.Login To Instamojo    amit_ktmar07  test12
    LHSPage.Open Product List Page
    ProductListPage.Click Add Product

    AddProductPage.Select Physical Product
    #AddProductPage.Select Product Image
#    AddProductPage.Remove Image
#    AddProductPage.Select PWYW Price
#    AddProductPage.Select Free Price
#    AddProductPage.Select Fixed Price
    AddProductPage.Enter Product Title
    AddProductPage.Enter Product Description
    AddProductPage.Enter Selling Price
    AddProductPage.Enter Discounted Price
    AddProductPage.Enter Stock
    AddProductPage.Enter Min Order Quantity
    AddProductPage.Enter Max Order Quantity
    AddProductPage.Enter SKU
    AddProductPage.Enter Shipwithin Days
    AddProductPage.Enter Product Weight
    #AddProductPage.Enter Meta Title
    #AddProductPage.Enter Meta Description
    #AddProductPage.Enter Canonical Url
    AddProductPage.Enter Thankyou Note
    AddProductPage.Enter Redirect Url
    #AddProductPage.Enter Webhook Url
    AddProductPage.Save Product

    #AddProductPage.Verify the error
    productlistpage.verify add product success


