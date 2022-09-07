*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
select all textfield
    [Arguments]    ${fieldLocator}
    Press Keys    ${fieldLocator}    CONTROL+a
    #Press Keys    ${fieldLocator}    COMMAND+a

clear input textfield
    [Arguments]    ${fieldLocator}
    Press Keys    ${fieldLocator}    CONTROL+a+CONTROL+x
    #Press Keys    ${fieldLocator}    COMMAND+a+COMMAND+x

Click Element Using JavaScript Xpath
    [Arguments]  ${xpath}
    [Documentation]
	...  Click element using javascript while passing location using xpath
    Execute JavaScript    document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.click();

Type BMP characters
    [Arguments]    ${code}    ${text}
    log    ${code}
    Execute Javascript  document.getElementById('${code}').value = '${text}'
    #Execute Javascript  document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.value = '${text}'

#    click element    ${xpath}
#    Execute javascript
#    ...    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;
#    ...    _editor.setValue('${text}');

My Scroll Element Into View
    [Arguments]    ${Element}
    ${x}=        Get Horizontal Position  ${Element}
    ${y}=        Get Vertical Position    ${Element}
    #${y}=    evaluate    ${y}-120
    Execute Javascript  window.scrollTo(${x}, ${y})