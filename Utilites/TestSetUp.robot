*** Settings ***
Library  SeleniumLibrary
Resource  ../Utilites/Browsers.robot



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
    [Arguments]    ${browser}
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait  20s

Close Instamojo
    sleep    2s
    close all browsers


Open online Store
    Open Browser  ${store_url}  ${browser}
    Maximize Browser Window
    sleep  1s
    Set Selenium Implicit Wait  20s

