*** Settings ***
Library  SeleniumLibrary    timeout=20s
Resource  ../../POMs/Store/StoreLoginPage.robot

*** Variables ***
# These are the WebElements

${LoginemailID}  xpath://input[@id='email']
${LoginPW}  xpath://input[@id='password']
${LoginBtn}  xpath://button[@id='submit']
${ForgotPassWord}    xpath://div[@color-customisation='page-bg']//div//div//div//div//div//div//div[@font-customisation='para-text']
${RegisterAccount}  xpath://body/div[@id='root']/div[@color-customisation='page-bg']/div/div/div/div/div/a/div[1]
${LoginWithGoogle}  xpath://body//div[@id='root']//div[@color-customisation='page-bg']//div//div//div//div//div[2]//span[1]//div[2]
${LoginWithFaceBook}  xpath://body/div[@id='root']/div[@color-customisation='page-bg']/div/div/div/div/div/div[3]/span[1]/div[2]
${ErrorMessage1}  xpath://li[contains(text(),'Please enter a username')]  #Please enter a username
${ErrorMessage2}  xpath://li[contains(text(),'Please enter your password')]  #lease enter your password
${ErrorMessage3}  xpath://p[@class='message fail']  #Are you share you entered right username and password
${home}     xpath://span[@id='header-home']
${storeaccount}   xpath=//img[@alt='Sign in']


*** Keywords ***
Navigate to Loginpage
     click element    ${storeaccount}

Insert login username
    [Arguments]  ${email}
    Input Text  ${LoginemailID}  ${storeemail}  clear=true

Insert login password
    [Arguments]  ${password}
    Input Password  ${LoginPW}  ${storepassword}  clear=true

Click login button
    Click Button   ${loginBtn}

Click forgot password
    Click Button  ${ForgotPassWord}

Click signup for free
    Click Link  ${RegisterAccount}

Click google login
    Click Button  ${LoginWithGoogle}

Click facebook login
    Click Button  ${LoginWithFaceBook}

Login to store
    [Arguments]    ${storeemail}    ${storepassword}
    Insert Login Username    ${storeemail}
    Insert Login Password    ${storepassword}
    Click Login Button
    sleep    4s

#Validations
Verify the login page is displayed
       Page Should Contain Textfield  ${LoginemailID}
       Page Should Contain Textfield  ${LoginPW}
       Page Should Contain Button  ${LoginBtn}

Verify the error message for invalid login
    [Arguments]    ${error_message}
    page should contain    ${error_message}

Verify the success login
    Page Should Contain Element    ${home}
