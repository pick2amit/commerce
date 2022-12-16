*** Settings ***
Library  SeleniumLibrary    timeout=20s

*** Variables ***
${ManageOrderHeading}    xpath://h1[normalize-space()='Manage Orders']
${SearchOrderInputBox}    xpath://input[@placeholder='Search orders']
${OrderCount}    xpath://div[@class='table-pagination']
${1stOrderLink}    xpath:(//td)[4]
${NoOrderText}    xpath:/td[contains(normalize-space(),'No records to display')]


*** Keywords ***
Get order count
    sleep    2s
    ${count}  Get Text    ${OrderCount}
    log    whole text is: ${count}
    ${count} =    Set Variable  ${count.split("of ")}
    ${count} =    Set Variable  ${count[-1]}
    ${result} =    convert to integer    ${count}
    [Return]    ${result}

Verify order list
    wait until element is visible  ${ManageOrderHeading}  timeout=25s
    TRY
        page should contain element    ${NoOrderText}
    EXCEPT    # match any error
        ${count}    Get order count
        should be true    ${count} >= 1
        page should contain element    ${OrderCount}
    END

Open order detail page
    click element    ${1stOrderLink}
