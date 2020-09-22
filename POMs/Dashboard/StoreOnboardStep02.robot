*** Settings ***

*** Variables ***
# What are your business social profiles? Locators
${BusinesDetailHeading}  xpath://h2[contains(text(),'What are your business social profiles?')]
${InstagramUN}  xpath://fieldset[@class='input-bg insta']//input[@placeholder='Example : yourstore']
${FBPage}  xpath://fieldset[@class='input-bg fb']//input[@placeholder='Example : yourstore']
${YoutubeChannel}  xpath://fieldset[@class='input-bg yt']//input[@placeholder='Example : yourstore']
${WebsiteLink}  xpath://input[@placeholder='Example: www.yourwebsite.com']
${Next:WhatAreYouSelling}  xpath://button[@class='wizard-btn pull-right']
${BackBtn}  xpath://button[@class='back-btn']



*** Keywords ***
Enter insta username
    Input Text  ${InstagramUN}  akt-insta

Enter FB page
    Input Text  ${FBPage}  akt.fb.com

Enter Youtube channel
    Input Text  ${YoutubeChannel}  akt.youtube.com

Enter Website
    Input Text  ${WebsiteLink}  www.akt.syncupcom

Click on Next Button of Step02
    Click Button  ${Next:WhatAreYouSelling}


Verify the onboard step02 page is displayed
  Page should contain element  ${BusinesDetailHeading}
  Page should contain element  ${InstagramUN}
  Page should contain element  ${Next:WhatAreYouSelling}
