*** Settings ***
Library  SeleniumLibrary  timeout=15s
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
#${}  xpath:
#${}  xpath:
#${}  xpath:
#${}  xpath:
${ResellingToggleBtn}  xpath://label[@for='available_in_reseller_networkSettingCheckbox']
${SEOToggleBtn}  xpath://label[@for='product_seoSettingCheckbox']
${MetaTitle}  xpath://input[@name='meta_title']
${MetaDescription}  xpath://textarea[@name='meta_description']
${CanonicalURL}  xpath://input[@name='meta_canonical_url']
${ThanksNote}  xpath://textarea[@name='note']
${RedirectURL}  xpath://input[@name='redirect_url']
${WebhookURL}  xpath://input[@name='webhook_url']


*** Keywords ***
Select physical product
    #sleep    2s
    Click Element   ${PhysicalProduct}
    sleep    4s
Select product image
    sleep    2s
    #Choose File    ${AddImage}  ..${/}..${/}..${/}DataDriven${/}dusky.png ${CURDIR}
    Choose File    ${AddImage}  ${EXECDIR}/DataDriven/dusk.png
    sleep   2s
Remove image
    Click Element    ${removeimage}
    sleep    2s
Enter product title
    Input Text    ${Title}  DIR Pycharm This is a product title for the DUSK
Enter product description
    Input Text    ${description}  This is the Product DUSK description. I am adding few more details.
Select fixed price
    Click Element    ${fixedpricebtn}
Select PWYW price
    Click Element    ${PWYWBtn}
Select free price
    Click Element    ${freebtn}
Enter selling price
    Input Text    ${SellingPrice}  250
Enter discounted price
    Click Element    ${discountedpricecheckbox}
    Input Text    ${discountedprice}  200
Enter stock
    Input Text    ${stock}  99
Enter min order quantity
    Input Text    ${minorderlimit}  1
Enter max order quantity
    Input Text    ${maxorderlimit}  10
Enter SKU
    Input Text    ${sku}  sku@0122
Enter shipwithin days
    Input Text    ${shipwithin}  2
Enter product weight
    Input Text    ${weight}  200
Enter meta title
    Input Text    ${metatitle}  this is meta title
Enter meta description
    Input Text    ${metadescription}  this is meta description
Enter canonical url
    Input Text    ${canonicalurl}  http://canonical.abc.com
Enter thankyou note
    Input Text    ${thanksnote}  Thanks for purchasing this product
Enter redirect url
    Input Text    ${redirecturl}  http://redirect.abc.com
Enter webhook url
    Input Text    ${webhookurl}  http://webhook.abc.com
Save product
    Click Element    ${savebtn}
Get current url
    ${CurrentURL}  Get Location
    Page Should Contain    ${CurrentURL}

