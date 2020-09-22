*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${BankAccountNumber}  xpath://li[1]//div[2]//div[1]//div[1]//ul[1]//li[1]//div[1]//input[1]
${ConfirmBankAccount}  xpath://input[contains(@placeholder,'Re-enter account number')]
${IFSC}  xpath://input[contains(@class,'flush--bottom')]
${CreateAccount}  xpath://input[@class='btn-green btn-block']
${BankAccNum}  9988776655
${IFSCCode}  VIJB0001050

*** Keywords ***
Enter the Bank account number
  Input Text  ${BankAccountNumber}  ${BankAccNum}

Reenter the bank account number
  Input Text  ${ConfirmBankAccount}  ${BankAccNum}

Enter the IFSC code
  Input Text  ${IFSC}  ${IFSCCode}

Click on the create account button
  Click Element  ${CreateAccount}

  sleep  10s

Verify the bank details page is displayed
   Page Should Contain Element  ${BankAccountNumber}
   Page Should Contain Element  ${ConfirmBankAccount}
   Page Should Contain Element  ${IFSC}
   Page Should Contain Element  ${CreateAccount}