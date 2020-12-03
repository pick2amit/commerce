*** Settings ***


*** Variables ***

${SearchText}  xpath://div[@class='search-wrapper']//div//input[@placeholder='Search Products']
${SearchButton}  xpath://div[@class='search-wrapper']//div//i[@class='fa fa-search']
${FirstProduct}  xpath://section[@id='product_search_wrapper']//div[@class="item col-md-3 col-sm-4 col-xs-6 ng-scope"][1]//img


*** Keywords ***

Seacrh product in store
    Input Text  ${SearchText}  Physical Product
    sleep  2s
    Click Element  ${SearchButton}
    sleep  3s


Select the first searched product
   Click Element   ${FirstProduct}

Verify if the seach suggesions are displayed
  Page Should Contain Element  ${FirstProduct}
















