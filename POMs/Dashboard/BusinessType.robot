*** Settings ***

*** Variables ***
${WhatTypeOfBusinessText}  xpath://h3[contains(@class,'soft--bottom text-grey flush')]
${IndividualCheckBox}  xpath://input[@name='individual']
${RegisteredOrganizationCheckBox}  xpath://input[contains(@name,'organization')]
${PropYes}  xpath://div[contains(@class,'can-has-errors')]//div//label[1]//input[1]
${PropNo}  xpath://input[contains(@name,'not-propreitor')]
${Next:Business Details}  xpath://input[contains(@value,'Next: Business Details')]


*** Keywords ***

Select the individual type
  Click Element  ${IndividualCheckBox}
  sleep  2s

Select registered organization type
  Click Element  ${RegisteredOrganizationCheckBox}
  sleep  2s

Select proprietor yes
  Click Element  ${PropYes}

Select proprietor no
  Click Element  ${PropNo}


Click on the next:business details button
  Click Element  ${Next:Business Details}

Verify the business type page is displayed
   Page Should Contain Element  ${WhatTypeOfBusinessText}
   Page Should Contain Element  ${IndividualCheckBox}
   Page Should Contain Element  ${RegisteredOrganizationCheckBox}
