*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# element list in LHS menu
${CreateNewBtn}  xpath://button[normalize-space()='Create New']
${Dashboard}  xpath://span[normalize-space()='Dashboard']
${PaymentHeading}  xpath://div[normalize-space()='Payments']
${PaymentLink}  xpath://span[normalize-space()='Payment Links']
${SmartPages}  xpath://span[normalize-space()='Smart Pages']
${Payments}  xpath://span[normalize-space()='Payments']
${Payouts}  xpath://span[normalize-space()='Payouts']
${Refunds}  xpath://span[normalize-space()='Refunds']
${ResolutionCenter}  xpath://span[normalize-space()='Resolution Center']
${Spends}  xpath://span[normalize-space()='Spends']
${Shipping}  xpath://span[normalize-space()='Shipping']
${APIPlugins}  xpath://span[normalize-space()='API & Plugins']
${Reseller}  xpath://span[normalize-space()='Reseller']
${Analytics}  xpath://span[normalize-space()='Analytics']
${AppSrore}  xpath://span[normalize-space()='App Store']

${OnlineStoreHeading}  xpath://div[normalize-space()='Online Store']
${Products}  xpath://span[normalize-space()='Products']
${AllProducts}  xpath://span[normalize-space()='All Products']
${Categories}  xpath://span[normalize-space()='Categories']
${Attributes}  xpath://span[normalize-space()='Attributes']
${ProductOptions}  xpath://span[normalize-space()='Product Options']
${ReviewRating}  xpath://span[normalize-space()='Reviews & Ratings']

${StoreSetup}  xpath://span[normalize-space()='Store Setup']
${StoreProfile}  xpath://span[normalize-space()='Profile']
${StoreLogo}  xpath://span[normalize-space()='Logo & Favicon']
${StorePage&Menu}  xpath://span[normalize-space()='Pages and Menu']
${StoreDomain}  //span[normalize-space()='Custom Domain']
${StoreScripts}  xpath://span[normalize-space()='Scripts']
${StorePolicies}  xpath://span[normalize-space()='Policies']
${StoreThemes}  xpath://span[normalize-space()='Themes']
${EditTheme}  xpath://span[normalize-space()='Edit Theme']
${SocialMediaLinks}  xpath://span[normalize-space()='Social Media Links']
${StoreTestimonials}  xpath://span[normalize-space()='Store Testimonials']
${StoreTax}  xpath//span[normalize-space()='Tax']

${Orders}  xpath://span[normalize-space()='Orders']
${AllOrders}  xpath://span[normalize-space()='All Orders']
${AbandonedCarts}  xpath://span[normalize-space()='Abandoned Carts']
${Enquiries}  xpath://span[normalize-space()='Enquiries']

${MarketingHeading}  xpath://div[normalize-space()='Marketing']
${Campaigns}  xpath://span[normalize-space()='Campaigns']
${SMSEmails}  xpath://span[normalize-space()='SMS and Emails']
${AllCampaigns}  xpath://span[normalize-space()='All Campaigns']

${Discounts}  xpath://span[normalize-space()='Discounts']
${Coupons}  xpath://span[normalize-space()='Coupons']
${DiscountLinks}  xpath://span[normalize-space()='Discount Links']
${WholesaleDiscounts}  xpath://span[normalize-space()='Wholesale Discounts']
${ReferralDiscounts}  xpath://span[normalize-space()='Referral Discounts']

${SEO}  xpath://span[normalize-space()='SEO']
${Basic SEO}  xpath://span[normalize-space()='Basic SEO']
${CustomMetatags}  xpath://span[normalize-space()='Custom Metatags']
${Google Webmaster}  xpath://span[normalize-space()='Google Webmaster']
${SocialPost}  xpath://span[normalize-space()='Social Post']
${MojoPlus}  xpath://span[normalize-space()='MojoPlus']
${MojoPlusRewards}  xpath:(//span[contains(text(),'Rewards')])[1]
${MojoPlusBenefits}  xpath://span[normalize-space()='Benefits']

*** Keywords ***
Click on the Create New button
    click element  ${createnewbtn}

Open product list page
    scroll element into view    ${Products}
    click element    ${Products}
    click element    ${AllProducts}



