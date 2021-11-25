*** Settings ***
Library  SeleniumLibrary    timeout=10s
Resource  ../../Utilites/Browsers.robot

*** Variables ***
${MobileNumber}   xpath://div[@class='columns small-10']//input
${SendOTP}  xpath://input[@class='btn-green btn-block']
${OTPField1}  xpath://div[contains(@class,'can-has-errors')]//div//div[1]//input[1]
${OTPField2}  xpath://div[contains(@class,'columns medium-12 small-centered')]//div[2]//input[1]
${OTPField3}  xpath://div[contains(@class,'row')]//div[3]//input[1]
${OTPField4}  xpath://div[4]//input[1]
${VerifyOTP}  xpath://input[contains(@class,'btn btn-green btn-block push--bottom')]
${test}  xpath://h3[@class='flush--top']

*** Keywords ***
Enter the mobile number
    sleep    3s
    Input Text  ${MobileNumber}  1234567890

Click on send OTP button
    Click Button  ${SendOTP}

Enter the OTP
    Input Text  ${OTPField1}  1
    sleep  1s
    Input Text  ${OTPField2}  2
    sleep  1s
    Input Text  ${OTPField3}  3
    sleep  1s
    Input Text  ${OTPField4}  4
    sleep  1s

Click on the verify otp button
  Click Element  ${VerifyOTP}
  sleep  2s
  ${btnValue}  Get Text  ${test}
  ${passed} =   Run Keyword And Return Status   Should be Equal   ${btnValue}  Get started with Instamojo
  [Return]   ${passed}

Verify the otp page is displayed
   sleep  2s
   Page Should Contain Element  ${MobileNumber}
   Page Should Contain Element  ${SendOTP}




