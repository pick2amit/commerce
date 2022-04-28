*** Settings ***
Library  SeleniumLibrary
Resource  ../Utilites/Browsers.robot

Library  SeleniumLibrary


*** Variables ***
${StoreURL} =  https://vishal-patil450.stores.mjc.instamojo.com/?ref=profile_bar

*** Keywords ***

Open ChromeHeadless
    [Arguments]    ${url}
    ${chrome_options} =  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Open Instamojo
    [Arguments]    ${Browser}
    #Open ChromeHeadless  ${IMOJO}
    Open Browser  ${staging_url}  ${Browser}
    Maximize Browser Window
    sleep  1s
    Set Selenium Implicit Wait  20s

Close Instamojo
    sleep    3s
    Close Browser


Open online Store
    Open Browser  ${StoreURL}  ${Safari}
    Maximize Browser Window
    sleep  1s
    Set Selenium Implicit Wait  20s

