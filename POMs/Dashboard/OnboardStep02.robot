*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# What are your business social profiles? Locators
${BusinesDetailHeading}  xpath://h2[contains(text(),'What are your business social profiles?')]
${InstagramUN}  xpath://input[@name='instagram_username']
${FBPage}  xpath://input[@name='facebook_username']
${YoutubeChannel}  xpath://input[@placeholder='Example : yourstore']
${WebsiteLink}  xpath://input[@placeholder='Example: www.yourwebsite.com']
${Next:WhatAreYouSelling}  xpath://button[@class='wizard-btn pull-right']
${BackBtn}  xpath://button[@class='back-btn']

*** Keywords ***
Enter insta username
    Input Text  ${InstagramUN}  instaPage

Enter FB page
    Input Text  ${FBPage}  aktfb

Enter Youtube channel
    Input Text  ${YoutubeChannel}  https://www.youtube.com/c/ChuChuTV

Enter Website
    Input Text  ${WebsiteLink}  www.aktsyncup.com

Click on Next Button of Step02
    Click Button  ${Next:WhatAreYouSelling}


Verify the onboard step02 page is displayed
  Page should contain element  ${BusinesDetailHeading}
  Page should contain element  ${InstagramUN}
  Page should contain element  ${Next:WhatAreYouSelling}