*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${Congratulationstext}  xpath://h3[contains(text(),'Congratulations!')]
${TickIcon}  xpath://i[contains(@class,'nc-icon-outline ui-1_check-circle-08 lg')]
${InstaMojoFeeToggleButton}  xpath://label[contains(@class,'tgl-btn')]
${GoToDashBoardButton}  xpath://a[contains(@class,'btn btn-green btn-block push--bottom')]



*** Keywords ***
Click on the go to dashboard button
  Click Element  ${GoToDashBoardButton}


Verify the Congratulations page is displayed
   Page Should Contain Element  ${Congratulationstext}
   Page Should Contain Element  ${TickIcon}
   Page Should Contain Element  ${InstaMojoFeeToggleButton}