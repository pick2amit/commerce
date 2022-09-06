*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${pageHeading}    xpath://h1
${HomepageDDMenu}    xpath://h5[contains(text(),'Home')]/parent::div/parent::div/following-sibling::div[2]/descendant::i
${EditLiveLink}    xpath://div[normalize-space()='Edit Live']

@{WindowHandlers}
*** Keywords ***
open homepage edit section
    click element    ${HomepageDDMenu}
    sleep    1s
    click element    ${EditLiveLink}
    @{WindowHandlers}=    get window handles
    #log to console   List is: ${WindowHandlers}
    switch window    ${WindowHandlers}[1]
    ${currentURL}    get location
    log    ${currentURL}
    ${newURL}=  set variable    ${currentURL}?edit_content=True&sideBar=editPage&view=desktop
    go to    ${newURL}

swith to dashboard window
    switch window    ${WindowHandlers}[0]