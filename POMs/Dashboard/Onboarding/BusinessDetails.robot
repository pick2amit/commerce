*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${CategoryList}  xpath://li[@class='business-category']//select[@class='small-12']
${SubCategoryList}  xpath://li[@class='business-sub-category']//select[@class='small-12']
${AnualTurnover}  xpath://div[@class='columns small-11']//select[@class='small-12']
${HowOldBusiness}   xpath://div[contains(@class,'can-has-errors')]//li[contains(@class,'business-website')]//div[contains(@class,'can-has-errors')]//select[contains(@class,'small-12')]
${NumberOfEmployees}  xpath://option[contains(text(),'Self Employed')]/parent::*
${WebSiteNoCheckBox}  xpath://li[5]//div[2]//label[2]//input[1]


${DescriptionTextArea}  xpath://textarea
${MoreBusinessDetails}  xpath://input[contains(@class,'btn-green btn-block')]

*** Keywords ***

Select the business category
  sleep  2s
  Set Selenium Implicit Wait  10s
  Select From List By Value   ${CategoryList}  1
  sleep  5s

Select the business sub category
  Select From List By Value   ${SubCategoryList}  1
  sleep  2s


Select the anual turnover
  Select From List By Value   ${AnualTurnover}  1
  sleep  2s

Select the how old business
  Select From List By Value   ${HowOldBusiness}  1
  sleep  2s

Select the number of employees
  Select From List By Value   ${NumberOfEmployees}  1
  sleep  2s

select no website radiobox
  Click Element  ${WebSiteNoCheckBox}
  sleep  2s

Enter the product or Service in detail
  Input Text  ${DescriptionTextArea}  This is description is for testing purpose This is description is for testing purpose This is description is for testing purpose This is description is for testing purpose
  sleep  2s


Click on the next:more business details button
  Click Element  ${MoreBusinessDetails}
  sleep  2s


Verify the business details page is displayed
   Page Should Contain Element  ${CategoryList}
   Page Should Contain Element  ${SubCategoryList}
   Page Should Contain Element  ${AnualTurnover}
   Page Should Contain Element  ${HowOldBusiness}