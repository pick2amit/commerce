*** Settings ***


*** Variables ***
${BuyNow}  xpath://button[@class='product-buynow theme-btn theme-btn-solid theme-btn-lg font-lg ng-binding']


*** Keywords ***


Click on buy now button
   Click Element  ${BuyNow}