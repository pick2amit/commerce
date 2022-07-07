*** Settings ***
Library  SeleniumLibrary    timeout=20s
Library    String

*** Variables ***
${CategoryHeading}    xpath://h1[@class='push-one-half--top gamma']
${AddCategoryBtn}    xpath://button[@class='btn-green btn-block flush']
#Add category form locators
${CreateCategoryHeading}    xpath://h4[@class='push border-bottom soft--bottom']
${CategoryName}    xpath://input[@name='name']
${ActiveToggleBtn}    xpath://label[@for='active-store-toggleSettingCheckbox']
${FeaturedToggleBtn}    xpath://label[@for='featured-store-toggleSettingCheckbox']
${SaveBtn}    xpath://button[contains(@type,'submit')]
${CancelBtn}    xpath://button[@class='btn btn-block flush']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']

*** Keywords ***
Verify category list
    page should contain element    ${CategoryHeading}

Open create category form
    sleep    2s
    click element   ${addcategorybtn}

Verify create category form heading
    page should contain element    ${CreateCategoryHeading}

Enter the category name
    ${Random} =  Generate Random String  8  [LOWER]
    ${categories_name} =    Set Variable  ${categories_name}-${Random}
    input text    ${categoryname}    ${categories_name}

Select the active toggle
    click element    ${activetogglebtn}

Select the featured toggle
    click element    ${featuredtogglebtn}

Save category
    click element    ${savebtn}

Verify add category success
    page should contain    Created category successfully
    page should contain element    ${ToastMsg}