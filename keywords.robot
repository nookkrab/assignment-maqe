*** Settings ***
Library           SeleniumLibrary
Library           String

*** Variables ***
${browser_profile}    add_argument("start-maximized");add_argument("--incognito")

*** Keywords ***
### Steps Keywords ###
User has opened Banana website using Chrome browser
   Open Browser                         https://www.bnn.in.th/th/p?q=iPhone13       Chrome        options=${browser_profile}

User has closed notification pop-up
    Wait Until Element Is Visible        css=div#close-button-1545222288830            5
    Click Element                        css=div#close-button-1545222288830

User has selected first product in the product list
    Wait Until Element Is Visible        css=div.product-link.product-item:first-child               5                    
    Click Element                        css=div.product-link.product-item:first-child
    Click Element                        css=button.btn.-primary.btn-accept

User has adjusted product quantity to be "${product_quantity}"
    Wait Until Element Is Visible         css=input#input0            5
    Input Text                            css=input#input0            ${product_quantity}
    Press Keys                            css=input#input0            ENTER

User has added iPhone13 into the shopping cart
    Wait Until Element Is Visible        css=button.btn.btn-add-to-cart.-tertiary               5
    Click Element                        css=button.btn.btn-add-to-cart.-tertiary
    
User has redirected to their shopping cart
    Wait Until Element Is Visible        css=a.btn.-secondary.btn-view-shopping-cart            5
    Click Element                        css=a.btn.-secondary.btn-view-shopping-cart

User has increased product quantity for "${product_quantity_cart}" in cart
    Wait Until Element Is Visible        css=input#input25411            5
    Input Text                           css=input#input25411            ${product_quantity_cart}
    Press Keys                           css=input#input25411            ENTER

User has decreased product quantity for "${product_quantity_cart}" in cart
    Wait Until Element Is Visible        css=input#input25411            5
    Input Text                           css=input#input25411            ${product_quantity_cart}
    Press Keys                           css=input#input25411            ENTER

User has clicked remove item button
    Wait Until Element Is Visible        css=button.btn.btn-delete        5
    Click Element                        css=button.btn.btn-delete

User has clicked checkout
    Wait Until Element Is Visible        css=button.btn.-primary.btn-checkout-action        5
    Click Element                        css=button.btn.-primary.btn-checkout-action

### Assertion Keywords ###
Subtotal should be updated to "${subtotal}"
    Wait Until Element Contains          css=div.price-estimated.-space-between        ${subtotal}        5
    Element Should Contain               css=div.price-estimated.-space-between        ${subtotal}

Display "${noti_message}" in the page
    Wait Until Element Contains          css=div.desc        ${noti_message}        5
    Element Should Contain               css=div.desc        ${noti_message}

Display sign-in/register modal
    Wait Until Element Contains          css=div.login-header       เข้าสู่ระบบ
    Element Should Contain               css=div.login-header       เข้าสู่ระบบ
