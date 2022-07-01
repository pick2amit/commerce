*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${MojoPlusRewardsImage}  xpath://div[@class='text-center']//img
${GoToMojoPlusButton}  xpath://div[@class='btn-block btn-green']
${SkipToDashBoardButton}  xpath://div[@class='btn-block btn push--top flush--bottom']

*** Keywords ***
Click on the go to mojo plus button
  Click Element  ${GoToMojoPlusButton}

Click on the skip to dashboard button
  Click Element  ${SkipToDashBoardButton}

Verify MojoPlus popup is displayed
   Set Selenium Implicit Wait  15s
   Page Should Contain Element  ${MojoPlusRewardsImage}
   Page Should Contain Element  ${GoToMojoPlusButton}
   Page Should Contain Element  ${SkipToDashBoardButton}