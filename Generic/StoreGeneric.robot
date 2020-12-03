*** Settings ***


*** Variables ***
${LoginButton}  xpath://a[contains(text(),'Login')]
${RegisterButton}  xpath://a[@id='user-register']
${TrackOrderButton}  xpath://a[@class='track-order secondary-link']
${StoreNameOrlogo}  xpath://div[@class='logo-wrapper pos-relative']//span[@class='store-name font-xl ng-binding'][contains(text(),'freethemeTesting')]
${SearchTextBox}  xpath://div[@class='search-wrapper']//div//input[@placeholder='Search Products']
${SearchIcon}  xpath://div[@class='search-wrapper']//div//button[@class='btn btn-default search-btn no-radius']
${Cart}  xpath://li[@class='cart-icon-wrap']

${StoreInfoTag}  xpath://h3[contains(text(),'Store Information')]
${InformationSection}  xpath://div[@class='col-sm-2']//h3[@class='footer-heading font-lg'][contains(text(),'Information')]
${BusinessSection}  xpath://h3[contains(text(),'Business')]
${CopyRights} xpath://body/div[@id='gmas_footer']/div[1]/p[1]
${AboutUs} xpath://body[1]/footer[1]/div[1]/div[1]/div[2]/ul[1]/li[1]/a[1]
${ContactUs}  xpath://a[contains(text(),'Contact us')]
${FAQ}  xpath://a[contains(text(),'FAQs')]
${Privacy}  xpath://a[contains(text(),'FAQs')]
${Disclaimer}  xpath://a[contains(text(),'Disclaimer')]
${ShippingAndDelivery}  xpath://a[contains(text(),'Shipping & Delivery')]
${CanellationAndRefund} xpath://body/footer[1]/div[1]/div[1]/div[3]/ul[1]/li[2]/a[1]
${TermsAndConditions}  xpath://a[contains(text(),'Terms & Conditions')]






*** Keywords ***

Verify the store header is displayed
  Page Should Contain Element  ${LoginButton}
  Page Should Contain Element  ${RegisterButton}
  Page Should Contain Element  ${TrackOrderButton}
  Page Should Contain Element  ${StoreNameOrlogo}
  Page Should Contain Element  ${SearchTextBox}
  Page Should Contain Element  ${SearchIcon}
  Page Should Contain Element  ${Cart}

Verify the store footer is displayed

  Page Should Contain Element  ${StoreInfoTag}
  Page Should Contain Element  ${InformationSection}
  Page Should Contain Element  ${BusinessSection}
  Page Should Contain Element  ${ContactUs}
  Page Should Contain Element  ${FAQ}
  Page Should Contain Element  ${Privacy}
  Page Should Contain Element  ${Disclaimer}
  Page Should Contain Element  ${ShippingAndDelivery}
  Page Should Contain Element  ${TermsAndConditions}


Click on the login button from store
  Click element  ${LoginButton}


