*** Settings ***
Library           SeleniumLibrary
Resource          keywords.robot
Test Teardown     Close Browser


*** Test Cases ***
User can increase product in cart
    Given User has opened Banana website using Chrome browser
      And User has closed notification pop-up
      And User has selected first product in the product list
      And User has added iPhone13 into the shopping cart
      And User has redirected to their shopping cart
     When User has increased product quantity for "2" in cart
     Then Subtotal should be updated to "89,400"

User can decrease product in cart
    Given User has opened Banana website using Chrome browser
      And User has closed notification pop-up
      And User has selected first product in the product list
      And User has adjusted product quantity to be "2"
      And User has added iPhone13 into the shopping cart
      And User has redirected to their shopping cart
     When User has decreased product quantity for "1" in cart
     Then Subtotal should be updated to "44,700"
    
User can remove product in cart
    Given User has opened Banana website using Chrome browser
      And User has closed notification pop-up
      And User has selected first product in the product list
      And User has added iPhone13 into the shopping cart
      And User has redirected to their shopping cart
     When User has clicked remove item button
     Then Display "ไม่มีสินค้าในตะกร้า" in the page

User can checkout product in cart (in case not logged in yet)
    Given User has opened Banana website using Chrome browser
      And User has closed notification pop-up
      And User has selected first product in the product list
      And User has added iPhone13 into the shopping cart
      And User has redirected to their shopping cart
     When User has clicked checkout
     Then Display sign-in/register modal