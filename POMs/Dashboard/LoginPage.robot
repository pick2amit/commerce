*** Settings ***
Library  SeleniumLibrary    timeout=20s
Resource  ../../POMs/Dashboard/LoginPage.robot

*** Variables ***
# These are the WebElements
${instamojoLogo}    xpath://a[@class='logo block small-only-push-half--bottom ']

${LoginUNTextBox}  xpath://input[@id='id_login_username']
${LoginPWTextBox}  xpath://input[@id='id_login_password']
${LoginButton}  xpath://input[@id='submit']
${ForgotPassWord}  xpath://a[contains(text(),'Forgot your password?')]
${SignUpForFree}  xpath://a[contains(text(),'Sign Up for Free')]
${LoginWithGoogle}  xpath://a[@class='social-login-btn block login-google']
${LoginWithFaceBook}  xpath://a[@class='social-login-btn block login-facebook']
${InstaMojoLogo}  xpath://a[contains(@class,'logo block small-only-push-half--bottom')]
${ErrorMessage1}  xpath://li[contains(text(),'Please enter a username')]  #Please enter a username
${ErrorMessage2}  xpath://li[contains(text(),'Please enter your password')]  #lease enter your password
${ErrorMessage3}  xpath://p[@class='message fail']  #Are you share you entered right username and password

${ProfileIcon}  xpath://div[@class='dropdown-control']//img
${DashboardHeading}  //h1[normalize-space()='Dashboard']

*** Keywords ***
Open the homepage
    wait until element is enabled    ${instamojoLogo}    timeout=30s
    click element    ${InstaMojoLogo}

Insert login username
    [Arguments]  ${username}
    Input Text  ${LoginUNTextBox}  ${username}  clear=true

Insert login password
    [Arguments]  ${password}
    Input Password  ${LoginPWTextBox}  ${password}  clear=true

Click login button
    Click Button   ${loginButton}

Click forgot password
    Click Button  ${ForgotPassWord}

Click signup for free
    Click Link  ${SignUpForFree}

Click google login
    Click Button  ${LoginWithGoogle}

Click facebook login
    Click Button  ${LoginWithFaceBook}

Login to instamojo
    [Arguments]    ${email}    ${password}
    Insert Login Username    ${email}
    Insert Login Password    ${password}
    Click Login Button
    sleep    4s

#Validations
Verify the login page is displayed
       Page Should Contain Textfield  ${LoginUNTextBox}
       Page Should Contain Textfield  ${LoginPWTextBox}
       Page Should Contain Button  ${LoginButton}

Verify the error message for invalid login
    [Arguments]    ${error_message}
    page should contain    ${error_message}

Verify the success login
    wait until element is visible   ${ProfileIcon}    timeout=15s
    Page Should Contain Element    ${DashboardHeading}
    Page Should Contain Element    ${ProfileIcon}