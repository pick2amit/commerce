*** Settings ***
Library  SeleniumLibrary
Variables    ${env}.py
Variables    testData.py

*** Keywords ***
Open Instamojo
    [Arguments]    ${browser}
    Open Browser  ${url}  ${browser}
    #Maximize Browser Window
    Set Window Size    1366    711
    Set Selenium Implicit Wait  20s

Close Instamojo
    sleep    2s
    close all browsers

back to homepage
    go to    ${url}dashboard
    sleep    2s
Open online Store
    Open Browser  ${store_url}  ${browser}
    Maximize Browser Window
    sleep  1s
    Set Selenium Implicit Wait  20s