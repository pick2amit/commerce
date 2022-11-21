*** Settings ***
Library  SeleniumLibrary    timeout=10s
Library    DateTime
Library  String

*** Variables ***
${couponpage}    xpath://span[normalize-space()='Coupons']
${Discounts}  xpath://span[normalize-space()='Discounts']
${Addcoupon}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/button
${deletecoupon}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div/table/tbody/tr/td[5]/div/div[2]/div/div[3]
${deletetoast}     xpath=//body/div[3]
${couponmenu}     xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/tbody/tr[1]/td[5]/div/div[1]/div/i
${editcoupon}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div/table/tbody/tr/td[5]/div/div[2]/div/div
${couponnameinput}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div/div/ul/li/div[2]/div/input
${promocodde}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[6]/div/ul/li/div[2]/div/input
${dateinput}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[4]/div/input
${nextmonth}    xpath=//div[6]/div[2]/div[1]/table/thead/tr[1]/th[3]
${selectdate}    xpath=//body/div[6]/div[2]/div[1]/table/tbody/tr[4]/td[6]
${applydate}     xpath=//body/div[6]/div[4]/button[2]
${eligiblleamount}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[5]/div/ul/li/div[2]/div/input
${promotype}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[7]/div/ul/li/div[2]/select
${promotypeinput}    xpath://select
${discountpercentage}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[8]/div/ul/li/div[2]/div/input
${maxdiscountamountt}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[9]/div/ul/li/div[2]/div/input
${frequencyallowed}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[13]/div/ul/li/div[2]/div/input
${Showoncheckout}     xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[15]/div[2]/div/div/div/label/label
${Selectifthecouponisactive}    xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[16]/div[2]/div/div/div/label/label
${Checkthistomakethecouponvalidonlyonceperbuyer}     xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[17]/div[2]/div/div/div/label/label
${savecoupon}     xpath=//div[@id='__next']/div/div/div[2]/div/div[2]/div/form/div[18]/button
${searchbar}    xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[1]/ul/li/input
${pagenation}   xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div
${table}     xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/thead/tr
${tabcoupontitle}    xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/thead/tr/th[1]/span
${tabdiscount}      xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/thead/tr/th[2]/span
${tabcode}  xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/thead/tr/th[3]/span
${tabstatus}    xpath=//*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/thead/tr/th[4]/span
${nocoupon}     xpath=////*[@id="__next"]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/table/tbody/tr/td

*** Keywords ***
Verify navigating tto discounts
     maximize browser window
     scroll element into view    ${discounts}
     click element     ${discounts}
     wait until page contains element    ${couponpage}

Veriy navigating to coupon page
    click element    ${couponpage}
    page should contain element    ${Addcoupon}
Verify addcoupon button is present
      page should contain element    ${Addcoupon}
Verify navigating to add coupon page
    click element    ${addcoupon}

Enter the name of the coupon
     click element    ${couponnameinput}
     input text    ${couponnameinput}    Akktt

select validunttil date

      click element    ${dateinput}
      click element    ${nextmonth}
      sleep    5s
      click element    ${selectdate}
      click element    ${applydate}

update Minimumorder amount
        click element    ${eligiblleamount}
        input text    ${eligiblleamount}     499

Enter PromoCode
         click element    ${promocodde}
         ${promotext} =  Generate Random String  07  [UPPER]
         ${promotextinput} =    Set Variable  ${promotext}
         input text    ${promocodde}    ${promotextinput}

Enter Promotype
        click element    ${promotype}
        click element     ${promotypeinput}
        Select From List By Label    ${promotypeinput}    Percentage off
        Click Element    ${promotype}

Enter Discount Percentage
        click element    ${discountpercentage}
        input text    ${discountpercentage}    20

Enter Max discount amount
        click element    ${maxdiscountamountt}
        input text    ${maxdiscountamountt}    150

Enter frequency allowed
         click element    ${frequencyallowed}
         input text    ${frequencyallowed}    1

Enable coupon options
         click element  ${Show on checkout}
         click element    ${selectifthecouponisactive}
         click element    ${checkthistomakethecouponvalidonlyonceperbuyer}

Save the coupon
         click element     ${savecoupon}
         page should contain element    ${addcoupon}

Delete Coupon
         click element    ${couponmenu}
         click element    ${deletecoupon}
         handle alert    accept

verify coupon is deleted
        page should contain element    ${deletetoast}

verify if search option is seen
        page should contain element    ${searchbar}

verify if action options are seen
        click element     ${couponmenu}
        page should contain element    ${editcoupon}
        page should contain element    ${deletecoupon}

Verify pagenation is seen
       page should contain element    ${pagenation}

verify table sort options are seen
        page should contain element    ${tabcoupontitle}
        page should contain element    ${tabdiscount}
        page should contain element    ${tabcode}
        page should contain element    ${tabstatus}

Verify coupon actions are seen
        page should contain element    ${couponmenu}








