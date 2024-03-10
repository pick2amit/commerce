*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${STORE_LOGO_LINK}      xpath://div[@class="navbarLayout"]/div/div/a/img
${BANNER}               xpath://*[@id="48"]/div/div/div/div[1]/div/div/ul/li[2]/div/div/div/div
${PS_HEADING}           xpath://h2[contains(text(), "Latest Products")]
${FIRST_PRODUCT_LINK}   (//*[contains(@id,"productList-")]//a/div)[1]

${HOMEPAGE_TITLE}       Car Wiring Diagram Electrical Control unit Cluster Meter Pdf File

${SearchText}           xpath://div[@class='search-wrapper']//div//input[@placeholder='Search Products']
${SearchButton}         xpath://div[@class='search-wrapper']//div//i[@class='fa fa-search']
${FirstProduct}         xpath://section[@id='product_search_wrapper']//div[@class="item col-md-3 col-sm-4 col-xs-6 ng-scope"][1]//img


*** Keywords ***
Navigate to the homepage
    go to    ${STOREFRONT_URL}

check for the store logo
    wait until page contains element        ${STORE_LOGO_LINK}

match the page title
    title should be    ${HOMEPAGE_TITLE}  message="Homepage title do not match."

check for the banner
    wait until page contains element    ${BANNER}

check for the product showcase
    wait until page contains element    ${PS_HEADING}

scroll to 1st product in list
    wait until element is enabled       ${FIRST_PRODUCT_LINK}
    scroll element into view            ${FIRST_PRODUCT_LINK}
    sleep    2s

open 1st produt in the list
    click element   ${FIRST_PRODUCT_LINK}



Seacrh product in store
    Input Text  ${SearchText}  Physical Product
    sleep  2s
    Click Element  ${SearchButton}
    sleep  3s

Select the first searched product
   Click Element   ${FirstProduct}

Verify if the seach suggesions are displayed
  Page Should Contain Element  ${FirstProduct}
