*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TermsLinkFooter}    xpath:(//a[normalize-space()='Terms'])[1]
${PageHeading}    xpath://h1
${ShowMoreBtn}    xpath:(//button[@class='btn'][normalize-space()='Show More'])[2]
${CompassThemeApplyBtn}    xpath://span[contains(text(),'Compass')]/parent::div/child::div/div[2]/span
${ComfortThemeApplyBtn}    xpath://span[contains(text(),'Comfort')]/parent::div/child::div/div[2]/span
${ApplyTheme}    xpath://button[normalize-space()='Apply Theme']
${DoneBtn}    xpath://button[normalize-space()='Done']

*** Keywords ***
select comfort theme
    scroll element into view    ${ComfortThemeApplyBtn}
    click element    ${ComfortThemeApplyBtn}
    wait until element is enabled    ${ApplyTheme}
    click element    ${ApplyTheme}
    page should contain    This theme is applied on your store
    click element    ${DoneBtn}

select compass theme
    TRY
        scroll element into view    ${CompassThemeApplyBtn}
    EXCEPT
        scroll element into view    ${TermsLinkFooter}
        click element    ${showmorebtn}
        scroll element into view    ${CompassThemeApplyBtn}
    END
    click element    ${CompassThemeApplyBtn}
    wait until element is enabled    ${ApplyTheme}
    click element    ${ApplyTheme}
    page should contain    This theme is applied on your store
    click element    ${DoneBtn}

#akt exp
#    TRY
#        scroll element into view    ${CompassThemeApplyBtn}
#    EXCEPT
#        scroll element into view    ${TermsLinkFooter}
#        click element    ${showmorebtn}
#        scroll element into view    ${CompassThemeApplyBtn}
#    END
#    ${Theme_status}=    get text    xpath://span[contains(text(),'Compass')]/parent::div/child::p
#    log to console  ${Theme_status}
#    #${Condition}    should be equal as strings  ${Theme_status}  Applied
#    pass execution if  ${Theme_status}=='Applied'    Theme already applied

get the applied theme
    ${Applied_theme}=    get text     xpath://b
    [Return]   ${Applied_theme}

Verify compass theme applied
    sleep    1s
    ${AppliedThemeName}=    get the applied theme
    should be equal as strings  ${AppliedThemeName}  Compass