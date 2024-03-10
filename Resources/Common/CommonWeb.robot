*** Settings ***
Library    SeleniumLibrary


*** Variables ***

*** Keywords ***
Start web test
    open browser    about:blank     ${BROWSER}
    maximize browser window
    set selenium timeout    20s

End web test
    sleep    2s
    close all browsers