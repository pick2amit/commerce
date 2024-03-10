*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LoginTextField}  xpath://input[@id='login_id_email']
${PasswordTextFeild}  xpath://input[@id='login_id_password']
${LoginButtonS}  xpath://button[contains(text(),'Log in')]
${SuccessLogin}  xpath://a[contains(text(),'Hi Visha')]

*** Keywords ***
Enter username
  Input text  ${LoginTextField}  amit.kt@instamojo.com

Enter password
  Input password  ${PasswordTextFeild}   12345678

Click on the submit button
  Set Selenium Implicit Wait  10s
  Click Button  ${LoginButtonS}

Verify valid login
  Set Selenium Implicit Wait  10s
  page should contain element  ${SuccessLogin}