*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${InitalUploadBtn}    xpath://button[normalize-space()='Upload Media']
${UploadBtn}    xpath:(//span[normalize-space()='Upload'])
${UploadBtn2}    id:upload-media
#${uploadImageLink}  xpath://span[@class='fsp-source-list__icon fsp-icon fsp-icon--url']
#${uploadImageLink}  xpath://*[@title='Link (URL)']
${uploadImageLink}  xpath://span[contains(text(),'Link (URL)')]/preceding-sibling::span
${uploadImageGDrive}    xpath://span[contains(text(),'Google Drive')]/preceding-sibling::span
${googleSigninBtn}    xpath://*[contains(text(),'Sign in with Google' )]

${imageUrlInput}    xpath://input[@type='url']
${submitImageUrl}    xpath://div[@class='fsp-icon fsp-url-source__submit-icon']
${finalUploadBtn}    xpath://span[@title='Upload']
${1stImageCheckbox}    xpath:(//div/div/div/div/div/div/div/div/div/div/label/span)[1]
${imageCheckbox}    xpath:(//div/div/div/div/div/div/div/div/div/div/label/span)
${selectMediaBtn}    xpath://button[normalize-space()='Select Media']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']

${LivecahtFrame}  xpath://iframe[@title='Intercom live chat message']
*** Keywords ***
upload an image
    [Arguments]    ${UploadBtnLocator}    ${ImageURL}
    click element    ${UploadBtnLocator}
    wait until element is visible    xpath:(//div[contains(text(),'My Media')])[1]    timeout=25s
    ${count}    get element count    ${uploadBtn}
#    sleep    4s
    run keyword and ignore error  click element   ${InitalUploadBtn}
    run keyword and ignore error  click element   ${uploadbtn}\[3]
    run keyword and ignore error  click element   ${uploadbtn}\[2]
    run keyword and ignore error  click element   ${uploadbtn}\[1]

    wait until element is visible    ${uploadImageLink}    timeout=20s
    #sleep    3s
    click element    ${uploadImageLink}
    clear element text  ${imageUrlInput}
    input text    ${imageUrlInput}  ${ImageURL}
    click element    ${submitImageUrl}
    wait until element is visible    ${finalUploadBtn}    timeout=20s
    wait until element is enabled  ${finalUploadBtn}    timeout=20s
    click element    ${finalUploadBtn}

upload an image v2
    [Arguments]    ${UploadBtnLocator}    ${ImageURL}
    click element    ${UploadBtnLocator}
    wait until element is visible    ${UploadBtn2}    timeout=25s
    click element   ${UploadBtn2}

    wait until element is visible    ${uploadImageLink}    timeout=20s
    sleep    2s
    click element at coordinates    ${uploadImageLink}    0    0
    #click element   ${uploadImageLink}
    clear element text  ${imageUrlInput}
    input text    ${imageUrlInput}  ${ImageURL}
    click element    ${submitImageUrl}
    wait until element is visible    ${finalUploadBtn}    timeout=20s
    wait until element is enabled  ${finalUploadBtn}    timeout=20s
    click element    ${finalUploadBtn}

delete media image
    [Arguments]    ${UploadBtnLocator}
    click element    ${UploadBtnLocator}


upload 1st image just uploaded
    wait until element is not visible    xpath://div[@class='fsp-summary__item-progress']     timeout=10s
    wait until element is not visible    ${ToastMsg}    timeout=6s
    #sleep    1s
    scroll element into view  ${1stImageCheckbox}
    click element    ${1stImageCheckbox}

    ${count}=    get element count    ${LivecahtFrame}
    IF    ${count}>0
        select frame  ${LivecahtFrame}
        click element    xpath://button[normalize-space()='Clear']
        unselect frame
    END
    sleep    1s
    click element    ${selectMediaBtn}

open media & select 1st image to upload
    [Arguments]    ${addImageLocator}    ${imageNo}
    click element    ${addImageLocator}
    click element    ${imageCheckbox}${imageNo}
    click element    ${selectMediaBtn}

link google drive
    [Arguments]    ${UploadBtnLocator}
    click element    ${UploadBtnLocator}
    wait until element is visible    xpath://div[contains(text(),'My Media')]    timeout=25s
    click element   ${uploadbtn}\[2]
    wait until element is visible    ${uploadImageGDrive}    timeout=20s
    sleep    2s
    click element at coordinates    ${uploadImageGDrive}    0    22
    sleep    2s
    wait until element is enabled    ${googleSigninBtn}    timeout=20s
    click element    ${googleSigninBtn}
    switch window    NEW    timeout=15s
    #input text    xpath://input[@type='email']    4mail2amit@gmail.com
    input text    id:identifierId    amit.kt@instamojo.com
    click element    xpath://span[contains(text(),'Next')]
    sleep    4s
    input password    xpath://input[@type='password']    Resetin_july22
    click element  xpath://span[contains(text(),'Next')]
    sleep    5s