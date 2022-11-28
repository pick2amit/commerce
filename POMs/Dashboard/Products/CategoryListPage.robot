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
${CategoryImageUploadBtn}    xpath://*[contains(text(),'+ Upload Image')]
${SaveBtn}    xpath://button[contains(@type,'submit')]
${CancelBtn}    xpath://button[@class='btn btn-block flush']
${ToastMsg}    xpath://div[@class='react-toast-notifications__container css-xg5s2c']
#Other locators
${CategoryCheckbox01}    xpath:(//div/div/div/label/span)[2]
${DeleteCategoryBtn}    xpath://*[contains(text(),'Delete')]
${ConfirmCategoryDelete}    xpath://button[normalize-space()='Yes, delete']
${FirstCategoryMenu}    xpath:(//div[@class='dropdown-control']//div)[1]
${DeleteCategoryDD}    xpath://div[@class='dropdown-control']/parent::div/div[2]/div/div[2]
${CreateSubcategoryDD}    xpath://div[@class='dropdown-control']/parent::div/div[2]/div/div[1]
${Edit1stCategory}    xpath:(//div/h5)[1]

*** Keywords ***
Verify category list
    page should contain element    ${CategoryHeading}

Open create category form
    sleep    2s
    click element   ${addcategorybtn}

Enter the category name
    [Arguments]    ${categories_name}
    ${Random} =  Generate Random String  10  [LOWER]
    ${categories_name} =    Set Variable  ${categories_name}-${Random}
    input text    ${categoryname}    ${categories_name}

Select the active toggle
    click element    ${activetogglebtn}

Select the featured toggle
    click element    ${featuredtogglebtn}

Save category
    wait until element is enabled  ${savebtn}
    sleep    2s
    click element    ${savebtn}

Select 1st category from the list
    click element   ${CategoryCheckbox01}

Click on the delete category
    click element    ${DeleteCategoryBtn}

Confirm category delete
    click element    ${ConfirmCategoryDelete}

Edit first category
    click element    ${Edit1stCategory}
    sleep    3s
    #Press Keys    ${CategoryName}    COMMAND+a+COMMAND+x
    Press Keys    ${CategoryName}    CONTROL+a+CONTROL+x
    ${timestamp}=    get time
    ${UpdatedCategoryname}=  set variable    Updated at-${timestamp}
    input text    ${CategoryName}    ${UpdatedCategoryname}
    Save category

Verify add category success
    wait until element is visible   ${ToastMsg}    timeout=10s
    page should contain    Created category successfully
    page should contain element    ${ToastMsg}

Verify update category
    wait until element is visible   ${ToastMsg}    timeout=10s
    page should contain    Updated category successfully
    page should contain element    ${ToastMsg}

Verify create category form heading
    page should contain element    ${CreateCategoryHeading}

Verify delete category success
    page should contain    Deleted Successfully
    page should contain element    ${ToastMsg}