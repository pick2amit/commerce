*** Settings ***
Library  SeleniumLibrary
Resource  ../../Utilites/Browsers.robot
Resource  ../../POMs/Dashboard/LoginPage.robot

*** Variables ***

# These are the WebElements

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

*** Keywords ***
# These are the posible Methods that can be used for login

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

#Validations

Verify the login page is displayed
       Page Should Contain Textfield  ${LoginUNTextBox}
       Page Should Contain Textfield  ${LoginPWTextBox}
       Page Should Contain Button  ${LoginButton}


