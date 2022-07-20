*** Settings ***
Library  SeleniumLibrary    timeout=10s

*** Variables ***
${verifyplan}   xpath=//div[@id='dashboard']/div/div/div[3]/section/div/div[2]/div/div
${mainpage}    xpath=//div[7]/div[4]/div


*** Keywords ***
Access Dashboard from sidebar
    click element   ${mainpage}

Verify Plan
        page should contain element    ${verifyplan}
