*** Settings ***
Library  SeleniumLibrary    timeout=20s
Resource    ../../CommonUtilities/Util01.robot

*** Variables ***
${AboutUsDetail}    xpath:(//h1/span[starts-with(text(),'About Us')]/parent::h1//following-sibling::p)
${WelcomeInputbox}    xpath://*[@id="toolbar_home_content1"]/following-sibling::div/div/div/h1
${WelcomeInputboxPara}    xpath://*[@id="toolbar_home_content1"]/following-sibling::div/div/div/p
${WelcomeInputboxHeading}    xpath://*[@id="toolbar_home_content1"]/following-sibling::div/div/div/h1
${frame}    xpath: //iframe[@name='merchant-desktop-view']
${WelcomeSaveBtn}    xpath:(//button[contains(text(),'Save')])[1]
${AboutUsSaveBtn}    xpath:(//button[contains(text(),'Save')])[2]

${quillEditorHeadingDD}    xpath://div[@id='toolbar_home_content1']/child::span[1]
${quillEditorH1}    xpath://div[@id='toolbar_home_content1']/child::span[1]/span[2]/span[1]
${quillEditorH2}    xpath://div[@id='toolbar_home_content1']/child::span[1]/span[2]/span[2]

${quillEditorAlignmentDD}    xpath://div[@id='toolbar_home_content1']/child::span[5]
${quillEditorAlignmentCenter}    xpath://div[@id='toolbar_home_content1']/child::span[5]/span[2]/span[2]

${quillEditorSizeDD}    xpath://div[@id='toolbar_home_content1']/child::span[3]
${quillEditorSizeSmall}    xpath://div[@id='toolbar_home_content1']/child::span[3]/span[2]/span[1]
${quillEditorSizeNormal}    xpath://div[@id='toolbar_home_content1']/child::span[3]/span[2]/span[2]
${quillEditorSizeLarge}    xpath://div[@id='toolbar_home_content1']/child::span[3]/span[2]/span[3]
${quillEditorSizeHuge}    xpath://div[@id='toolbar_home_content1']/child::span[3]/span[2]/span[4]

*** Keywords ***
enable editing
    switch window    NEW
    wait until element is enabled  xpath://*[normalize-space()='Edit Page']    timeout=10s
    click element    xpath://*[normalize-space()='Edit Page']

update the Welcome section
    [Arguments]    ${Content}
    select frame    ${frame}
    wait until element is enabled  ${WelcomeSaveBtn}
    run keyword and ignore error    scroll element into view  ${WelcomeSaveBtn}
    click element    ${WelcomeInputbox}
    Util01.clear input textfield    ${WelcomeInputbox}
    #input text  ${WelcomeInputbox}  ${Content}
    press keys    ${WelcomeInputbox}  ${Content}
    click element    ${WelcomeSaveBtn}
    page should contain    Updated Successfully
    wait until element is not visible  xpath:(//div[contains(text(),'Updated Successfully')])[1]    timeout=10s
    click element    xpath://button[@class='p-16 focus:outline-none']

change the Welcome text format
    select frame    ${frame}
    wait until element is enabled  ${WelcomeSaveBtn}
    run keyword and ignore error    scroll element into view  ${WelcomeSaveBtn}
    Util01.select all textfield  xpath://h1[normalize-space()='Welcome']
    click element    ${quillEditorSizeDD}
    click element    ${quillEditorSizeLarge}
    click element    ${WelcomeSaveBtn}
    page should contain    Updated Successfully