*** Settings ***
Library  SeleniumLibrary
Resource    ../POMs/Dashboard/LHSPage.robot
Variables    ${env}.py

*** Keywords ***
Open Instamojo
    #set log level    trace
    Open Browser  ${url2}  ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait  20s
    #set selenium speed    1s

Close Instamojo
    sleep    2s
    close all browsers

logout & open loginpage
    go to    ${url2}
    sleep    2s
    LHSPage.Logout
    wait until element is visible    (//a[contains(@href,'#')][normalize-space()='Log In'])[1]    timeout=30s
    Go to    ${url2}