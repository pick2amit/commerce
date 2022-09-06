*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# What are your business social profiles? Locators
${BusinesDetailHeading}  xpath://h2[contains(text(),'What are your business social profiles?')]
${InstagramUN}  xpath=//section[@id='gmas-main-wrapper']/div[2]/div/div[2]/fieldset/div/input
${FBPage}  xpath=//section[@id='gmas-main-wrapper']/div[2]/div/div[2]/fieldset[2]/div/input
${YoutubeChannel}  xpath://fieldset[@class='input-bg yt']//input[@placeholder='Example : yourstore']
${WebsiteLink}  xpath://input[@placeholder='Example: www.yourwebsite.com']
${Next:WhatAreYouSelling}  xpath=//section[@id='gmas-main-wrapper']/div[2]/div/div[2]/div/button
${BackBtn}  xpath://button[@class='back-btn']

*** Keywords ***
Enter insta username
    Input Text  ${InstagramUN}  akt

Enter FB page
    Input Text  ${FBPage}  aktfb

Enter Youtube channel
    Input Text  ${YoutubeChannel}  https://www.youtube.com/c/akt

Enter Website
    Input Text  ${WebsiteLink}  www.akt.syncupcom

Click on Next Button of Step02
    Click Button  ${Next:WhatAreYouSelling}


Verify the onboard step02 page is displayed
  wait until element is visible  ${BusinesDetailHeading}  timeout=10s
  Page should contain element  ${BusinesDetailHeading}
  Page should contain element  ${InstagramUN}
  Page should contain element  ${Next:WhatAreYouSelling}