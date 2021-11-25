*** Settings ***
Library  SeleniumLibrary


*** Variables ***
#Genric

${CreateNewButton}  xpath://button[normalize-space()='Create New']
${DashboardButton}  xpath://span[normalize-space()='Dashboard']

#Store Signup
${AddProductButton}  xpath://div[contains(text(),'Add Product')]
${EnablePaymentMessage}  xpath://span[contains(text(),'Payment collection is not enabled on your account.')]


#paayment signup variable
${CreateOnlineStoreButton}  xpath://div[contains(text(),'Create Online Store')]

*** Keywords ***

Click on the create link button
  wait Until Element Is Visible  ${CreateNewButton}}
  Click Element  ${CreateNewButton}


Verify the payment onboarding is successfull
   Page Should Contain Element  ${CreateNewButton}
   Page Should Contain Element  ${DashboardButton}


Verify the store intent user succesfully logged in
   Page Should Contain Element  ${AddProductButton}
   Page Should Contain Element  ${EnablePaymentMessage}
   Page Should Contain Element  ${DashboardButton}
   Page Should Not Contain Element  ${CreateOnlineStoreButton}

Verify the payment intent user succesfully logged in
   Page Should Contain Element  ${CreateOnlineStoreButton}
   #Page Should Contain Element  ${CreatePaymentLinkButton}
   Page Should Contain Element  ${DashboardButton}
   Page Should Not Contain Element  ${AddProductButton}

Verify both payment and store intent user succesfully logged in
   #Page Should Contain Element  ${AddProductButton}
   #Page Should Contain Element  ${CreatePaymentLinkButton}
   #Page Should Not Contain Element  ${CreateOnlineStoreButton}

