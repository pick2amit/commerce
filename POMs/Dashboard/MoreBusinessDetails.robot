*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${YourPanTextBox}  xpath://ul[contains(@class,'form-items-container')]/li[1]/div[2]/input
${PanName}  xpath://input[@placeholder='As mentioned on PAN Card']
${PanAdress}  xpath://div[contains(@class,'can-has-errors')]//textarea
${StateDD}  xpath://select[contains(@class,'flush--bottom')]
${PinCode}  xpath://input[contains(@placeholder,'Eg: 452016')]
${GST}  xpath://input[contains(@placeholder,'Optional')]
${Services}  xpath://input[contains(@name,'Services')]
${Product}  xpath://label[contains(@class,'soft-quarter--ends text-black inline-block small-12 medium-3 push--right')]//input[contains(@name,'Products')]
${Others}  xpath://label[3]//input[1]
${Next:Bank Details}  xpath://input[contains(@class,'btn-green btn-block')]


*** Keywords ***
Enter the pan details
  Input Text  ${YourPanTextBox}  ABCDE1233H
  sleep  2s

Enter the pan name
  ${PanNameGen} =   Generate Random String  10  [LOWER]
  Input Text  ${PanName}  ${PanNameGen}

Enter the address
  ${PanAddGen} =   Generate Random String  10  [LOWER]
  Input Text  ${PanAdress}  ${PanAddGen}

Select the state
  Select From List By Value   ${StateDD}  27

Enter the pincode
  Input Text  ${PinCode}  567887

Select the services
    Click Element  ${Services}

Click on next:bank details
    Click Element  ${Next:Bank Details}

Verify the more business details page is displayed
   Page Should Contain Element  ${YourPanTextBox}
   Page Should Contain Element  ${PanName}
   Page Should Contain Element  ${PanAdress}
   Page Should Contain Element  ${StateDD}


