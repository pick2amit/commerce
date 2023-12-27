*** Settings ***
Resource   ../../Utilites/TestSetUp.robot
Resource  ../../POMs/Store/StoreHomePage.robot


Suite Setup  Open online Store
Suite Teardown    Close Instamojo

*** Test Cases ***
Verify the storehomepage
    [Tags]    Smoke
    storehomepage.validate if store page gets loaded
    storehomepage.search product in store
    storehomepage.validate shop
    storehomepage.validate cart
    storehomepage.validate account
    storehomepage.validate contactus
    storehomepage.validate scroll until footer