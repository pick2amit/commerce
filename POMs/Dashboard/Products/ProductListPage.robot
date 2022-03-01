*** Settings ***
Library  SeleniumLibrary  timeout=15s

*** Variables ***
${AllProductHeading}  xpath://h1[normalize-space()='All Products']
${BulkEditLink}  xpath://span[normalize-space()='Bulk Edit']
${BulkImportLink}  xpath://span[normalize-space()='Bulk Import']
${AddProductBtn}  xpath://a[normalize-space()='Add Product']
${Search}  xpath:(//*[@class='search-field-container'])
${ProductCount}  xpath://div[@class='hide-for-small-only']//p[@class='inline flush--ends'][normalize-space()='1 - 10 of 517']
${count}
*** Keywords ***
Get product count
   ${count}  Get Text    ${productcount}
   [Return]    ${count}
Click Add Product
    Click Element   ${AddProductBtn}
    sleep    4s
