*** Settings ***
Documentation  Add Product
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot
Resource  ../../POMs/Dashboard/Products/AddProductPage.robot
#Resource  ../../POMs/Dashboard/Products/AddProductPage.robot
Test Setup  Open Instamojo    ${browser}
Test Teardown  Close Instamojo

*** Variables ***
${intial_count}
${final_count}
*** Test Cases ***
Add a physical product
    LoginPage.Login To Instamojo    amit_kt501  12345678
    LHSPage.Open Product List Page

    ${intial_count}   ProductListPage.Get product count
    ${intial_count} =    evaluate    ${intial_count}+1    #This should match with final count
    ProductListPage.Click Add Product

    AddProductPage.Select Physical Product
#    AddProductPage.Select Product Image
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
    #AddProductPage.Enter Redirect Url
    #AddProductPage.Enter Webhook Url
    AddProductPage.Save Product

    #AddProductPage.Verify the error
    productlistpage.verify add product success
    ${final_count}    ProductListPage.Get product count
    should be equal as integers    ${intial_count}    ${final_count}



