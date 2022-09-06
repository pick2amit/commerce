*** Settings ***
Library  SeleniumLibrary    timeout=20s
Library  String

*** Variables ***
# These are the WebElements for Business
${SignUpUNTextBox}  xpath://input[@id='id_email']
${SignUpPWTextBox}  xpath://input[@id='id_password']
${SignUpButton}   xpath://input[@id='submit-signup']
${SignUpWithGoogle}  xpath://a[@class='social-login-btn block login-google']
${SignUpWithFacebook}  xpath://a[@class='social-login-btn block login-facebook']
${ReferralCode}  xpath://a[contains(text(),'Have a referral code?')]
${LogIn}  xpath://a[@id='log_in_link']
#These are the links for the Consumer
${YourPaymentId}  xpath://input[@placeholder='MOJOXXXXXXXXXXXXXXXX']
${ReportPaymentProblem}  xpath://input[@name='payment_problem']
${ReportRefundProblem}  xpath://input[@name='refund_problem']
${SignUpAsConsumer}  xpath://input[@id='submit-consumer-signup']
${SignUpPW}  12345678
${Random}
${Domain}  @test.com

*** Keywords ***
Insert signup username
      ${Random} =  Generate Random String  10  [LOWER]
      ${SignUpUN} =    Set Variable  automation-${Random}${Domain}
      sleep  2s
      #Input Text  ${SignUpUNTextBox}  ${SignUpUN}
      Input Text  ${SignUpUNTextBox}    amit.kt+sep01@instamojo.com

Insert signup password
     Input Password  ${SignUpPWTextBox}  ${SignUpPW}

Click on signup button
     Click Button  ${SignUpButton}

Click on google signup
     Click Button  ${SignUpWithGoogle}

Click facebook signup
     Click Button  ${SignUpWithFacebook}

Click login
     Click Button  ${LogIn}

Click referralcode
     Click Button  ${ReferralCode}

#Validations
Verify the signup page is displayed
       sleep    2s
       Page Should Contain Textfield  ${SignUpUNTextBox}
       Page Should Contain Textfield  ${SignUpPWTextBox}
       Page Should Contain Button  ${SignUpButton}

##Methods for the Consumer Page
Insert paymentid
     Input Text  ${YourPaymentId}  VishaTestID

Check payment problem
     Select Checkbox   ${ReportPaymentProblem}

Check refund problem
     Select Checkbox   ${ReportRefundProblem}

Click signup as consumer
     Click Button  ${SignUpAsConsumer}

Signup consumer page should be opened
       Page Should Contain Textfield  ${YourPaymentId}