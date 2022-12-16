*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Dashboard/LoginPage.robot
Resource  ../../POMs/Dashboard/LHSPage.robot
Resource  ../../POMs/Dashboard/Products/ProductListPage.robot
Resource  ../../POMs/Dashboard/Products/AddProductPage.robot

Suite Setup    Run Keywords
...    Open Instamojo    AND
...    Login to dashboard
Suite Teardown    Close Instamojo

*** Variables ***
${intial_count}
${final_count}

*** Test Cases ***
Add a physical product
    [Tags]    Smoke
    LHSPage.Open Product List Page
    ProductListPage.Verify product list
    ${intial_count}   ProductListPage.Get product count
    ${intial_count} =    evaluate    ${intial_count}+1    #This should match with final count after adding 1 product
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
    AddProductPage.Enter Meta Title
    AddProductPage.Enter Meta Description
    AddProductPage.Enter Canonical Url
    AddProductPage.Enter Thankyou Note
    #AddProductPage.Enter Redirect Url
    AddProductPage.Enter Webhook Url
    AddProductPage.Save Product
    productlistpage.verify add product success
    ${final_count}    ProductListPage.Get product count
    should be equal as integers    ${intial_count}    ${final_count}

Delete a product
    [Tags]  Smoke
    ${current_url}=    get location
    IF    "products" in "${current_url}"
        sleep    .5s
    ELSE
        LHSPage.Open Product List Page
    END

    ${intial_count}=   ProductListPage.Get product count
    ${intial_count} =    evaluate    ${intial_count}-1    #This should match with final count after deleting 1 product
    ProductListPage.Select 1st product
    ProductListPage.Delete all selected products
    ProductListPage.Verify product list
    ${final_count}=    ProductListPage.Get product count
    should be equal as integers    ${intial_count}    ${final_count}
