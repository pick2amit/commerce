*** Settings ***
Library  SeleniumLibrary   timeout=20s
Resource    ../../../CommonUtilities/UploadImage.robot
#Variables   ../../TestData/testData.py
*** Variables ***
${CurrentURL}
#Product type locators
${PhysicalProduct}  xpath://h3[normalize-space()='Physical Product']
${DigitalProduct}  xpath://h3[normalize-space()='Digital File']
${EventTicket}  xpath://h3[normalize-space()='Event Tickets']
${Others}  xpath:////h3[normalize-space()='Others']
#Physical product form loctors
${BackBtn}  xpath://img[@src='/images/add-product/icons/icon-back.svg']
${SaveBtn}  xpath://button[normalize-space()='Save']
#${AddImage}  xpath://input[@value='Add Image']
${AddImage}  xpath://input[@type='file']
${cancelbtn}    xpath://img[@src='/images/add-product/icons/icon-close.svg']
${uploadProgressBar}    xpath://p[normalize-space()='uploading...']
${RemoveImage}  xpath://span[@class='close']
${path}  /Users/instamojo/Desktop/product-images/romance_at_dusk.png
${path2}  ./../../../DataDriven/dusk
${Title}  xpath://input[@name='title']
${Description}  xpath://div[@class='ql-editor ql-blank']
${FixedPriceBtn}  xpath://input[@value='default']
${PWYWBtn}  xpath://input[@value='pay_what_you_want']
${FreeBtn}  xpath://input[@value='is_free']
${SellingPrice}  xpath://input[@name='price']
${DiscountedPriceCheckBox}  xpath://label[normalize-space()='Discounted price (optional)']
${DiscountedPrice}  xpath://input[@name='discounted_price']
${stock}  xpath://input[@name='stock']
${UnlimitedStock}  xpath://label[normalize-space()='Unlimited']
${MinOrderLimit}  xpath://input[@name='min_order_quantity']
${MaxOrderLimit}  xpath://input[@name='max_order_qty']
${SKU}  xpath://input[@name='sku']
${ShipWithin}  xpath://input[@name='ship_in_days']
${Weight}  xpath://input[@name='weight']
${VariantsToggleBtn}  xpath://label[@for='variantsSettingCheckbox']
${AddCategory}  xpath://button[normalize-space()='Add New Category']
${SearchCategory}  xpath://input[@placeholder='search']
${ResellingToggleBtn}  xpath://label[@for='available_in_reseller_networkSettingCheckbox']
${SEOToggleBtn}  xpath://label[@for='product_seoSettingCheckbox']
${MetaTitle}  xpath://input[@name='meta_title']
${MetaDescription}  xpath://textarea[@name='meta_description']
${CanonicalURL}  xpath://input[@name='meta_canonical_url']
${ThanksNote}  xpath://textarea[@name='note']
${RedirectURL}  xpath://input[@name='redirect_url']
${WebhookURL}  xpath://input[@name='webhook_url']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']

*** Keywords ***
Select physical product
    sleep    1s
    Click Element   ${PhysicalProduct}

Select product image
    sleep    2s
    Choose File    ${AddImage}  ${EXECDIR}/DataDriven/dusk.png
    wait until element is not visible    ${uploadProgressBar}    timeout=15s
    #wait until element is visible    ${removeimage}    timeout=15s

Add product image
    [Arguments]    ${ProductImageURL}
    #UploadImage.upload an image    xpath://*[contains(text(),'Add Image')]    ${ProductImageURL}
    UploadImage.upload an image v2  xpath://*[contains(text(),'Add Image')]    ${ProductImageURL}
    UploadImage.upload 1st image just uploaded

Remove image
    Click Element    ${removeimage}
    sleep    2s
Enter product title
    [Arguments]    ${product_title}
    wait until element is enabled  ${Title}  timeout=10s
    press keys    ${Title}  ${product_title}
Enter product description
    [Arguments]    ${product_description}
    press keys    ${description}  ${product_description}
Select fixed price
    Click Element    ${fixedpricebtn}
Select PWYW price
    Click Element    ${PWYWBtn}
Select free price
    Click Element    ${freebtn}

Enter selling price
    [Arguments]    ${product_price}
    Input Text    ${SellingPrice}  ${product_price}
Enter discounted price
    [Arguments]    ${product_discountedPrice}
    Click Element    ${discountedpricecheckbox}
    Input Text    ${discountedprice}  ${product_discountedPrice}
Enter stock
    [Arguments]    ${product_stock}
    Input Text    ${stock}  ${product_stock}

Enter unlimited stock
    scroll element into view    ${unlimitedstock}
    click element    ${unlimitedstock}
Enter min order quantity
    [Arguments]    ${minimum_orderLimit}
    #scroll element into view    ${minorderlimit}
    #sleep    2s
    Input Text    ${minorderlimit}    ${minimum_orderLimit}
Enter max order quantity
    [Arguments]    ${maximum_orderLimit}
    Input Text    ${maxorderlimit}  ${maximum_orderLimit}
Enter SKU
    [Arguments]    ${product_sku}
    Input Text    ${sku}  ${product_sku}
Enter shipwithin days
    [Arguments]    ${ship_days}
    Input Text    ${shipwithin}  ${ship_days}
Enter product weight
    [Arguments]    ${product_weight}
    Input Text    ${weight}  ${product_weight}
Enter meta title
    [Arguments]    ${product_meta_title}
    Input Text    ${metatitle}  ${product_meta_title}
Enter meta description
    [Arguments]    ${product_meta_description}
    Input Text    ${metadescription}  ${product_meta_description}
Enter canonical url
    [Arguments]    ${product_canonical_url}
    Input Text    ${canonicalurl}  ${product_canonical_url}
Enter thankyou note
    [Arguments]    ${product_thanks_note}
    Input Text    ${thanksnote}  ${product_thanks_note}
Enter redirect url
    [Arguments]    ${product_redirect_url}
    Input Text    ${redirecturl}  ${product_redirect_url}
Enter webhook url
    [Arguments]    ${product_webhook_url}
    Input Text    ${webhookurl}  ${product_webhook_url}
Save product
    scroll element into view    ${savebtn}
    Click Element    ${savebtn}
Get current url
    ${CurrentURL}  Get Location
    Page Should Contain    ${CurrentURL}