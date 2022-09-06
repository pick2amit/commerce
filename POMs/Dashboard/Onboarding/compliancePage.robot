*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PageHeading}    xpath://h1[normalize-space()='GST Registration']
${PANInputBox}    xpath:(//input[@type='text'])[1]
${NameInputBox}    xpath://input[@placeholder='As mentioned on PAN Card']
${AddressInputBox}    xpath://div[@class='can-has-errors']//textarea
${StateDD}    xpath://select
${PincodeInputBox}    xpath://input[@placeholder='Eg: 452016']
${GSTINInputBox}    xpath://input[@placeholder='Optional']
${NextBtn}    xpath://button[normalize-space()='Next']
${ConfirmBtn}    xpath://button[normalize-space()='Confirm']

${submitconfirmationMsg}    xpath://*[@id="dashboard"]/div/div/div[3]/section/div/div/div/div/div/div/div[2]

*** Keywords ***
verify that compliance page displayed
    wait until element is visible    ${PageHeading}    timeout=20s
    page should contain element    ${PageHeading}
Enter PAN
    [Arguments]    ${PAN}
    input text    ${PANInputBox}    ${PAN}

Enter Name
    [Arguments]    ${Name}
    input text    ${NameInputBox}    ${Name}

Enter Address
    [Arguments]    ${Address}
    input text    ${AddressInputBox}    ${Address}

Enter State
    [Arguments]  ${State}
    Click Element    ${StateDD}
    Select From List By Label    ${StateDD}  ${State}

Enter PIN
    [Arguments]    ${PIN}
    input text    ${PINCODEINPUTBOX}    ${PIN}

Save compliance detail
    click element    ${NextBtn}
    sleep    2s
    wait until element is enabled  ${ConfirmBtn}  timeout=15s
    click element    ${ConfirmBtn}

Verify compliance submitted
    page should contain    Thank you for submitting your details
    page should contain element  ${submitconfirmationMsg}