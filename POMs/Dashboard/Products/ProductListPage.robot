import re
*** Settings ***
Library  SeleniumLibrary  timeout=15s

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
    log to console    I am from count method
    sleep    4s
    ${count}  Get Text    ${Productcount}
    ${count} =    Set Variable  ${count.split("of ")}
    ${count} =    Set Variable  ${count[-1]}
    ${result}=    convert to integer    ${count}
    log to console    fromcount method: ${result}
    ${result}=    evaluate    ${result}-1
    log to console    fromcount method updated: ${result}
    [Return]    ${result}

Click Add Product
    Click Element   ${AddProductBtn}
    #sleep    4s

My experment
    sleep    4s
#    ${count}  Get Text    ${Productcount}
#    log to console   Total product count is: ${count}
    TRY
        page should contain element    ${NoProducts}
    EXCEPT    # match any error
        ${count}  Get Text    ${Productcount}
        log to console   Total product count is: ${count}
        ${count} =    Set Variable  ${count.split("of ")}
        log to console   Updated count is: ${count}
        ${count} =    Set Variable  ${count[-1]}
        log to console   Last element of count is:${count}
        run keyword if    ${count} > 10    log to console    This store has atleast 1 product
    END





Verify add product success
    wait until element is visible   ${ToastMsg}
    page should contain    Product Added Successfully
    ${expectedTitle}    get text    ${latestProductTitle}
    #builtin.log to console    ${expectedTitle}
    log to console    ${expectedTitle}
    element text should be  ${latestProductTitle}    ${expectedTitle}
