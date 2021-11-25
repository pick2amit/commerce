*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${ContinueAsGuest}  xpath://button[@id='next1']



*** Keywords ***
Click on continue as guest button
  sleep  3s
  Click Element  ${ContinueAsGuest}


