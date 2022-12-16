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
${updated-title}    This is updated on DEC 22

*** Test Cases ***
Add a physical product
    [Tags]    Smoke
    LHSPage.Open Product List Page
    ProductListPage.Verify product list
    ${intial_count}   ProductListPage.Get product count
    ${intial_count} =    evaluate    ${intial_count}+1    #This should match with final count after adding 1 product
    ProductListPage.Click Add Product
    AddProductPage.Select Physical Product
    AddProductPage.Enter Product Title    ${product_title}
    AddProductPage.Enter Product Description    ${product_description}
    AddProductPage.Enter Selling Price    ${product_price}
    AddProductPage.Enter Discounted Price    ${product_discountedPrice}
    AddProductPage.Enter Stock    ${product_stock}
    AddProductPage.Enter Min Order Quantity    ${minimum_orderLimit}
    AddProductPage.Enter Max Order Quantity    ${maximum_orderLimit}
    AddProductPage.Enter SKU    ${product_sku}
    AddProductPage.Enter Shipwithin Days    ${ship_days}
    AddProductPage.Enter Product Weight    ${product_weight}
    AddProductPage.Enter Meta Title    ${product_meta_title}
    AddProductPage.Enter Meta Description    ${product_meta_description}
    AddProductPage.Enter Canonical Url    ${product_canonical_url}
    AddProductPage.Enter Thankyou Note    ${product_thanks_note}
    AddProductPage.Enter Webhook Url    ${product_webhook_url}
    AddProductPage.Save Product
    productlistpage.verify add product success
    ${final_count}=    ProductListPage.Get product count
    should be equal as integers    ${intial_count}    ${final_count}

Update product title
    [Tags]    Smoke
    ProductListPage.Open 1st product
    AddProductPage.Enter product title    ${updated-title}
    AddProductPage.Save product
    ProductListPage.Verify product list
    ${ActualTitle}=    ProductListPage.Get 1st product title
    should be equal as strings  ${ActualTitle}    ${updated-title}

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