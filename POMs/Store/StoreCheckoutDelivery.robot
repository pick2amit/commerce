*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${FirstNameTB}  xpath://input[@id='firstname']
${LastNameTB}  xpath://input[@id='lastname']
${EmailTB}  xpath://input[@id='email-address']
${MobileNoTB}  xpath://input[@id='contact']
${CityTB}  xpath://input[@id='city']
${AddressTA}  xpath://textarea[@id='address']
${CountryDD}  xpath://select[@id='country']
${StateDD}  xpath://select[@id='state']
${Pin/ZipCodeTB}  xpath://input[@id='code']
${ContinueToBag}  xpath://div[1]//a[3]

${FirstName} =  Vishal
${LastName}  =  Patil
${Email}    =  testac@gmail.com
${MobileNo} =  9988776666
${City}  =  belguam
${Address} =  testtesttest
${Country} =  105
${State}  =  16
${Pin/ZipCode} =  591254


*** Keywords ***

Enter the delivery details
    [Arguments]  ${FirstName}  ${LastName}  ${Email}  ${MobileNo}  ${City}  ${Address}  ${Country}  ${State}  ${Pin/ZipCode}
    Input Text  ${FirstNameTB}  ${FirstName}
    sleep  1s
    Input Text  ${LastNameTB}  ${LastName}
    sleep  1s
    Input Text  ${EmailTB}  ${Email}
    sleep  1s
    Input Text  ${MobileNoTB}  ${MobileNo}
    sleep  1s
    Input Text  ${CityTB}  ${City}
    sleep  1s
    Input Text  ${AddressTA}  ${Address}
    sleep  1s
    Select From List By Value  ${CountryDD}  ${Country}
    sleep  1s
    Select From List By Value  ${StateDD}  ${State}
    sleep  1s
    Input Text  ${Pin/ZipCodeTB}  ${Pin/ZipCode}

    sleep  1s





Click on continue to Bag
   Click Element  ${ContinueToBag}
   sleep  3s