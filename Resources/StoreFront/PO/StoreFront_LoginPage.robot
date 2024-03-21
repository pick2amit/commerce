*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${EMAIL_INPUT}              xpath://*[@id="email"]
${PASSWORD_INPUT}           xpath://*[@id="password"]
${LOGIN_BUTTON}             xpath://*[@id="submit"]
${LOGIN_ERROR1}             xpath://form/div/div[2]/span
${LOGIN_ERROR2}             xpath://*[@id="root"]/div[3]/div/div[2]/div/div/div/div
${LOGIN_SUCCESS_MESSAGE}    xpath://*[@id="toast"]/div

${actual_error1}            error1
${actual_error2}            error2


*** Keywords ***
Enter user email
  [Arguments]                         ${USER_EMAIL}
  wait until page contains element    ${EMAIL_INPUT}
  Input text                          ${EMAIL_INPUT}      ${USER_EMAIL}

Enter password
  [Arguments]                         ${USER_PASSWORD}
  wait until page contains element    ${PASSWORD_INPUT}
  Input password                      ${PASSWORD_INPUT}   ${USER_PASSWORD}

Click on login button
  wait until element is enabled       ${LOGIN_BUTTON}
  Click Button                        ${LOGIN_BUTTON}

Verify valid login
  wait until page contains element    ${LOGIN_SUCCESS_MESSAGE}
  page should contain element         ${LOGIN_SUCCESS_MESSAGE}

Verify invalid login error
    [Arguments]    ${ERROR_TYPE}
    IF    $ERROR_TYPE == 'error1'
            page should contain element    ${LOGIN_ERROR1}
            ${Error_1}=    get text    ${LOGIN_ERROR1}

    ELSE IF  $ERROR_TYPE == 'error2'
            sleep    2s
            page should contain element    ${LOGIN_ERROR2}
            ${Error_2}=    get text    ${LOGIN_ERROR2}

    ELSE
            log    No match found
    END