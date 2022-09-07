*** Settings ***
Library  SeleniumLibrary
Resource    ../POMs/Dashboard/LHSPage.robot
Variables    ${env}.py

*** Keywords ***
Open Instamojo
    set log level    debug
    Open Browser  ${url2}  ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait  10s

Close Instamojo
    sleep    2s
    close all browsers

logout & open loginpage
    #LHSPage.Logout
    go to    https://www.instamojo.com/accounts/logout
    sleep    2s
    Go to    ${url2}