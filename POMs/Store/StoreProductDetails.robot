*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BuyNow}  xpath://button[@class='product-buynow theme-btn theme-btn-solid theme-btn-lg font-lg ng-binding']
${AddToCart}  xpath://button[@class='product-atc theme-btn theme-btn-lg font-lg']
${ProductTitle}  xpath://h1[@class='product-title alternate-bg ng-scope']
${ProductPrice}  xpath://div[@class='product-price alternate-bg ng-scope']
${ProductImage}  xpath://img[@class='img-responsive center-block product-image']
${ProductQuantity}  xpath://div[@class='alternate-bg product-quantity ng-scope']


*** Keywords ***


Click on buy now button
   Click Element  ${BuyNow}

Verify the product details page is displayed
  Page Should Contain Element  ${BuyNow}
  Page Should Contain Element  ${AddToCart}
  Page Should Contain Element  ${ProductTitle}
  Page Should Contain Element  ${ProductPrice}
  Page Should Contain Element  ${ProductImage}
  Page Should Contain Element  ${ProductQuantity}
