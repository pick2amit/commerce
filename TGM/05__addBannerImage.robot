*** Settings ***
Library  DataDriver    ../DataDriven/TGM - Auto-Batch.xlsx    sheet_name=PD-1
Resource    ../Utilites/TestSetup2.robot
Resource    ../POMs/Dashboard/LoginPage.robot
Resource    ../POMs/Dashboard/LHSPage.robot
Resource  ../POMs/Dashboard/StoreSetup/EditThemePage.robot

Suite Setup    Open Instamojo
Test Teardown    logout & open loginpage
Test Template  add banner
Suite Teardown    Close Instamojo

*** Variables ***
${slider01Type}    all
${Banner01ImageURL}    https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/51DWgNo1fdL._SX3000_.jpg
*** Test Cases ***
add banner for: ${email}
    [Tags]    banner

*** Keywords ***
add banner
    NO OPERATION
#    [Arguments]    ${email}  ${password}
#    loginpage.Verify the login page is displayed
#    loginpage.Login to instamojo  ${email}  ${password}
    loginpage.Verify the success login
#    LHSPage.Open edit theme page
#    EditThemePage.expand banner01
#    EditThemePage.delete banner01 image
#    EditThemePage.add banner01 image    ${Banner01ImageURL}
#    EditThemePage.select 1st image to upload
#    EditThemePage.enter banner01 heading    Banner01Heading
#    EditThemePage.enter banner01 subheading    Banner01SubHeading
#    EditThemePage.select slider type    ${slider01Type}
#    EditThemePage.save banner image
#    EditThemePage.Verify add banner success