*** Settings ***
Library  SeleniumLibrary
Resource  ../POMs/Dashboard/LoginPage.robot
Variables    ${env}.py
Variables    testData.py

*** Keywords ***
Open Instamojo
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait  20s

Login to dashboard
    LoginPage.Verify The Login Page Is Displayed
    LoginPage.Login To Instamojo  ${username}  ${password}
    LoginPage.Verify The Success Login

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