*** Settings ***
Library  SeleniumLibrary
Resource  ../Utilites/Browsers.robot
<<<<<<< HEAD
Library  SeleniumLibrary


*** Variables ***
${StoreURL} =  https://vishal-patil350.stores.mjc.instamojo.com/?ref=profile_bar
=======

>>>>>>> origin/master
*** Keywords ***

Open ChromeHeadless
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Open Instamojo
<<<<<<< HEAD
=======
    #Open ChromeHeadless  ${IMOJO}
>>>>>>> origin/master
    Open Browser  ${IMOJO}  ${chrome}
    Maximize Browser Window
    sleep  1s
    Set Selenium Implicit Wait  20s

Close Instamojo
    Close Browser


Open online Store
    Open Browser  ${StoreURL}  ${chrome}
    Maximize Browser Window
    sleep  1s
    Set Selenium Implicit Wait  20s

