*** Settings ***
Library  SeleniumLibrary
Resource    ../../../CommonUtilities/UploadImage.robot
Resource    ../../../CommonUtilities/Util01.robot

*** Variables ***
${BannerPageHeading}    xpath://h3[normalize-space()='Slider Images']
${sliderCheckbox}    xpath://label[normalize-space()='Enable Slider Image']
${Banner01Detail}    xpath:(//*[@id='slider-image-cnt'])[1]
${Banner01UploadBtn}    xpath:(//*[contains(text(),'+ Upload Image')])[1]
${HeadingToggleBtn}    xpath://label[@for='slider-text-toggle1SettingCheckbox']
${Banner01HeadingInputbox}    xpath://input[@name='slider_heading1']
${Banner01SubHeadingInputbox}    xpath://input[@name='slider_subheading1']
${banner01link}    xpath://input[@name='slider_link1']
${BannerTypeDropdown}    xpath://select[@name='slider_type1']
${Banner01ButtonText}    xpath://input[@name='slider_button_label_1']
${SaveBannerBtn}    xpath://button[normalize-space()='Save Slide']

${banner01TextToggleBtn}    xpath://label[@for='slider-text-toggle1SettingCheckbox']
${banner01ButtontToggleBtn}    xpath://label[@for='slider-button-toggle1SettingCheckbox']
*** Keywords ***
select slider checkbox
    click element    ${sliderCheckbox}

expand banner01
    wait until element is visible    ${Banner01Detail}
    click element    ${Banner01Detail}

check and delete if banner already added
    ${count}=   get element count    xpath://form[1]/div/div[2]/div[1]/div
    Run Keyword If   ${count} > 0    delete banner01 image

disable text on the banner01
    ${count}=   get element count    ${Banner01HeadingInputbox}
    Run Keyword If   ${count} > 0    click element  ${banner01TextToggleBtn}
    wait until element is not visible  ${Banner01HeadingInputbox}

disable button on the banner01
    ${count}=   get element count    ${Banner01ButtonText}
    Run Keyword If   ${count} > 0    click element  ${banner01ButtontToggleBtn}
    wait until element is not visible  ${Banner01ButtonText}

add banner01 image
    [Arguments]    ${Banner01ImageURL}
    wait until element is visible    ${BannerPageHeading}    timeout=20s
    page should contain element    ${BannerPageHeading}
    UploadImage.upload an image    ${Banner01UploadBtn}    ${Banner01ImageURL}

select 1st image to upload
    UploadImage.upload 1st image just uploaded

enter banner01 heading
    [Arguments]    ${banner01Heading}
    scroll element into view    ${Banner01HeadingInputbox}
    Util01.clear input textfield  ${Banner01HeadingInputbox}
    input text    ${Banner01HeadingInputbox}    ${banner01Heading}

enter banner01 subheading
    [Arguments]    ${banner01SubHeading}
    #clear element text
    scroll element into view    ${Banner01SubHeadingInputbox}
    clear input textfield  ${Banner01SubHeadingInputbox}
    input text    ${Banner01SubHeadingInputbox}    ${banner01SubHeading}

select slider type
    [Arguments]    ${Banner01Type}
    scroll element into view    ${BannerTypeDropdown}
    click element    ${BannerTypeDropdown}
    select from list by value  ${BannerTypeDropdown}    ${Banner01Type}

delete banner01 image
    scroll element into view    xpath://form[1]/div/div[2]/div[1]/div
    sleep    2s
    click element    xpath://form[1]/div/div[2]/div[1]/div
    sleep    2s
    #click element    (//*[local-name()='path'])[72]
save banner image
    wait until element is enabled  ${SaveBannerBtn}    timeout=20s
    scroll element into view    ${SaveBannerBtn}
    click element    ${SaveBannerBtn}

Verify add banner success
    page should contain    Updated Successfully