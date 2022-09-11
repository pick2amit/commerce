*** Settings ***
Library  SeleniumLibrary    timeout=20s
Resource    ../../../CommonUtilities/UploadImage.robot

*** Variables ***
${LogoImage}    xpath://form/child::div/img
${LogoHeading}    xpath://h1[normalize-space()='Add Logo']
${FaviconHeading}    xpath://h1[normalize-space()='Add Favicon']
${UploadLogoBtn}    xpath:(//form/div[2]/div/i)[1]
${ClearLogoCheckbox}    xpath://label[normalize-space()='Clear Logo']
${SaveLogoBtn}    xpath:(//button[contains(normalize-space(),'Save')])[1]

${UploadFaviconBtn}    xpath:(//form/div[2]/div)[2]
${ClearFaviconCheckbox}    xpath://label[normalize-space()='Clear Favicon']
${SaveFaviconBtn}    xpath:(//button[contains(normalize-space(),'Save')])[2]

*** Keywords ***
add store logo
    [Arguments]    ${LogoURL}
    UploadImage.upload an image    ${UploadLogoBtn}    ${LogoURL}
    UploadImage.upload 1st image just uploaded
    wait until element is enabled  ${SaveLogoBtn}
    click element    ${SaveLogoBtn}

uplod image from google drive
    wait until element is visible    ${LogoHeading}
    page should contain element    ${LogoHeading}
    UploadImage.link google drive    ${UploadLogoBtn}

add store favicon
    sleep    4s
    ${current_url}=    get location
    sleep    2s
    go to    ${current_url}
    [Arguments]    ${FaviconURL}
    run keyword and ignore error    scroll element into view   ${SaveFaviconBtn}
    wait until element is visible  ${FaviconHeading}
    page should contain element    ${FaviconHeading}
    UploadImage.upload an image    ${UploadFaviconBtn}    ${FaviconURL}
    UploadImage.upload 1st image just uploaded
    wait until element is enabled  ${SaveFaviconBtn}
    click element    ${SaveFaviconBtn}

Verify logo page displayed
    sleep    2s
    wait until element is visible    ${LogoHeading}
    page should contain element    ${LogoHeading}
#    ${Selenium_timeout}=    get selenium timeout
#    Log    ${Selenium_timeout}


Verify logo added
    #page should contain    Updated Successfully
    wait until element is visible    ${LogoImage}    timeout=10s
    page should contain element    ${LogoImage}