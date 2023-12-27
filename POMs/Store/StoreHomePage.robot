*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${Searchicon}    xpath://div/div[3]/div[1]/div/div/div[1]/div[2]/div[1]/div/img
${SearchText}  xpath://input[@id="searchInput"]
${SearchButton}  xpath=//button[contains(.,'Search')]
${storeaccount}   xpath=//img[@alt='Sign in']
${storecart}      xpath=//img[@alt='Cart']
${home}     xpath://span[@id='header-home']
${shop}    xpath://span[@id='header-shop-all']
${aboutus}    xpath://span[@id='header-about-us']
${More}     xpath://span[@id='header-more']
${moredropdown}    xpath://a[@link='#']//img[@alt='Arrow']
${FAQs}     xpath://span[@id='header-faqs']
${Contactus}    xpath://span[@id='header-contact-us']
${shopall}     xpath://div[contains(text(),'Shop All')]
${filtersort}    xpath://div[@button-customisation='page-button']
${submit}    xpath://button[@id='submit']
${category}    xpath://div[@id='11603251']//div//h2[contains(@font-customisation,'section-heading')]
${footer}     xpath://div[@id='page-footer']


*** Keywords ***
Validate if store page gets loaded
     page should contain element    ${home}
     page should contain element    ${storeaccount}
     page should contain element    ${storecart}
     page should contain element    ${More}
     page should contain element    ${Contactus}
     page should contain element    ${FAQs}
     page should contain element    ${shop}

Search product in store
    click element    ${searchicon}
    Input Text  ${SearchText}  Physical Product
    sleep  2s
    Click Element  ${SearchButton}
    sleep  3s

Validate Shop
     click element    ${home}
     click element    ${shop}
     click element    ${shopall}
     page should contain element    ${filtersort}

Validate Account
     click element    ${home}
     click element    ${storeaccount}
     page should contain element    ${submit}

Validate Cart
     click element    ${home}
     click element    ${storecart}
     page should not contain element    ${category}

Validate contactus
          click element    ${home}
          click element    ${contactus}
          page should contain element    ${submit}CO

Validate Scroll until footer
          click element    ${home}
          maximize browser window
          execute javascript  window.scrollTo(0,200)
          page should contain element    ${footer}
