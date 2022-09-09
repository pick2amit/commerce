*** Settings ***
Library  DataDriver    ../DataDriven/TGM-09Sep.xlsx   sheet_name=PD1-5
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

*** Test Cases ***
add banner for: ${email}
    [Tags]    add_banner    all

*** Keywords ***
add banner
    [Arguments]    ${email}  ${password}    ${banner_image}
    loginpage.Verify the login page is displayed
    loginpage.Login to instamojo  ${email}  ${password}
    LHSPage.Open edit theme page
    EditThemePage.expand banner01
    EditThemePage.check and delete if banner already added
    EditThemePage.add banner01 image    ${banner_image}
    EditThemePage.select 1st image to upload
    EditThemePage.disable text on the banner01
    EditThemePage.disable button on the banner01
    EditThemePage.select slider type    ${slider01Type}
    EditThemePage.save banner image
    EditThemePage.Verify add banner success