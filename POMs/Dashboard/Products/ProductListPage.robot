*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${AllProductHeading}  xpath://h2[normalize-space()='All Products']
${BulkEditLink}  xpath://span[normalize-space()='Bulk Edit']
${BulkImportLink}  xpath://span[normalize-space()='Bulk Import']
${AddProductBtn}  xpath://a[normalize-space()='Add Product']
${SearchInputBox}  xpath:(//*[@class='search-field-container'])
#${ProductCount}  xpath:(//p[@class='inline flush--ends'])[2]
${ProductCount}  xpath:(//span[@class='css-0'])[2]
${count}
${NoProducts}    xpath://div[@class='soft-double text-center box-outlined-white']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']
#${latestProductTitle}    xpath://div[@class='product-list']//div[1]//div[2]//div[1]//h2[1]
${latestProductTitle}    xpath:(//*[contains(text(),'This is a beautiful DUSK')])[1]
*** Keywords ***
Get product count
    sleep    2s
    ${count}  Get Text    ${Productcount}
    ${count} =    Set Variable  ${count.split("of ")}
    ${count} =    Set Variable  ${count[-1]}
    ${result} =    convert to integer    ${count}
    [Return]    ${result}

Click Add Product
    Click Element   ${AddProductBtn}

Verify add product success
    wait until element is visible   ${ToastMsg}    timeout=20s
    page should contain    Product Added Successfully
    ${expectedTitle}    get text    ${latestProductTitle}
    element text should be  ${latestProductTitle}    ${expectedTitle}

Verify add product success v2
    wait until element is visible   ${ToastMsg}    timeout=6s
    page should contain    Product Added Successfully

Verify product list
    wait until element is visible  ${AllProductHeading}  timeout=25s
    TRY
        page should contain    No Products
    EXCEPT    # match any error
        ${count}    Get product count
        should be true    ${count} >= 1
        page should contain element    ${Productcount}
    END