*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${AllProductHeading}  xpath://h1[normalize-space()='All Products']
${BulkEditLink}  xpath://span[normalize-space()='Bulk Edit']
${BulkImportLink}  xpath://span[normalize-space()='Bulk Import']
${AddProductBtn}  xpath://a[normalize-space()='Add Product']
${SearchInputBox}  xpath:(//*[@class='search-field-container'])
${ProductCount}  xpath:(//p[@class='inline flush--ends'])[2]
${count}
${NoProducts}    xpath://div[@class='soft-double text-center box-outlined-white']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']
${latestProductTitle}    xpath://div[@class='product-list']//div[1]//div[2]//div[1]//h2[1]

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
    wait until element is visible   ${ToastMsg}    timeout=15s
    page should contain    Product Added Successfully
    ${expectedTitle}    get text    ${latestProductTitle}
    element text should be  ${latestProductTitle}    ${expectedTitle}