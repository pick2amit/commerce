*** Settings ***
Library  DataDriver    ../DataDriven/TGM - Auto-Batch.xlsx    sheet_name=PD-1
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource  ../POMs/Dashboard/Products/ProductListPage.robot
Resource  ../POMs/Dashboard/Products/AddProductPage.robot
Variables    ../CommonUtilities/readexcel.py

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  Add physical product
Suite Teardown    Close Instamojo

*** Test Cases ***
add Product for: ${email}
    [Tags]    product

*** Keywords ***
add physical product
    [Arguments]    ${email}  ${password}    ${username}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}  ${password}
    loginpage.Verify the success login
    sleep    2s
    LHSPage.Open product list page

    ${result}=    evaluate    readexcel.read_data_from_excel
    ...    ("/Users/amittiwari/Documents/QA_v2/QA/DataDriven/TGM - Auto-Batch.xlsx", "Post Data", '${username}')
    log  result: ${result}
    FOR    ${titlegroup}  IN    @{result}
         log    Title Group: ${titlegroup}
         log    Title: ${titlegroup}[0]
         log    Desc: ${titlegroup}[1]
         log    Image URL: ${titlegroup}[2]
        ProductListPage.Click Add Product
        AddProductPage.Select Physical Product
        #AddProductPage.Add product image  ${titlegroup}[2]
        AddProductPage.Enter Product Title    ${titlegroup}[0]
        AddProductPage.Enter Product Description  ${titlegroup}[1]
        AddProductPage.Enter Selling Price    100
        AddProductPage.Enter unlimited stock
        AddProductPage.Enter Shipwithin Days    3
        AddProductPage.Save Product
        productlistpage.verify add product success
        sleep    2s
    END