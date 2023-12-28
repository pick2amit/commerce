*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Store/StoreLoginPage.robot


Suite Setup  Open online Store
Suite Teardown    Close Instamojo

*** Test Cases ***
Verify the validLogin
    [Tags]    Smoke
    StoreLoginPage.Navigate to Loginpage
    storeloginpage.login to store   ${storeemail}    ${storepassword}
    storeloginpage.verify the success login