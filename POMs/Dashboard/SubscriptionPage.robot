*** Settings ***
Library    SeleniumLibrary    timeout=20s

*** Variables ***
${StoreHeading}    xpath://p[normalize-space()='Online Store']

${YearlyPlanRadioBtn}    xpath:(//input[@type='radio'])[1]
${MonthlyPlanRadioBtn}    xpath:(//input[@type='radio'])[2]

${SelectPlanBtn}    xpath:(//button[contains(normalize-space(),'Select Plan')])[2]
${PopupHeading}    xpath://h3[normalize-space()='Upgrade Subscription Plan']
${CoupnCode}    xpath://span[contains(normalize-space(),'Enter coupon code')]
${CouponInputBox}    xpath://input[@placeholder='COUPON']
${ApplyCouponBtn}    xpath://a[normalize-space()='Apply']
${CouponAppliedMsg}    xpath://span[@class='text-green']
${PayBtn}    xpath://button[normalize-space()='Proceed to Pay']
${PlanUpdateConfirmation}    xpath://html/body/div[8]/div/div/div/div[2]/div/div/p[1]
${PlanUpdateOKBtn}    xpath://button[normalize-space()='OK']

${CurrentPlanHeading}    xpath://*[contains(text(),'CURRENT PLAN')]
${CurrentPlanName}    xpath://*[contains(text(),'CURRENT PLAN')]/following-sibling::p

${Loader}    xpath://div[@class='iframe-loader']
${PlanName}
*** Keywords ***
select yearly plan and proceed
    wait until element is visible  ${storeheading}    timeout=20s
    wait until element is visible  ${CurrentPlanHeading}  timeout=35s
    scroll element into view    ${SelectPlanBtn}
    #CLICK ELEMENT    ${MonthlyPlanRadioBtn}
    CLICK ELEMENT    ${YearlyPlanRadioBtn}
    sleep    2s
    CLICK ELEMENT    ${SelectPlanBtn}

Make payment using coupon
    [Arguments]  ${coupon}
    wait until element is visible    ${PopupHeading}  timeout=15s
    click element  ${CoupnCode}
    input text    ${CouponInputBox}    ${coupon}
    CLICK ELEMENT    ${ApplyCouponBtn}
    wait until element is visible    ${CouponAppliedMsg}    timeout=10s
    wait until element is enabled    ${PayBtn}
    click element    ${PayBtn}
    sleep    4s
    wait until element is not visible    ${Loader}    timeout=45s
    sleep    2s
    select frame  xpath://iframe[@id='imojo-rc-iframe']
    click element  ${PlanUpdateOKBtn}
    unselect frame

get current plan
    sleep    3s
    ${PlanName} =    GET TEXT    ${CurrentPlanName}
    RETURN   ${PlanName}

Verify plan upgrade
    ${PlanName} =    get current plan
    should be equal as strings  ${PlanName}  Growth Yearly