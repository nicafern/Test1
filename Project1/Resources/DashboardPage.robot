*** Settings ***
Library    Selenium2Library

*** Variables ***
${USERdashboard_css}  css=li.ama-off-canvas-service-info:nth-child(1) > div.service-primary-heading
${MyDashboard_link}  link=My dashboard
${Plan_xpath}  xpath=//span[contains(text(),'Plan')]
${Payments_xpath}   xpath=//span[contains(text(),'Payments')]
${PaymentMethod_link}  link=Payment method
${PersonalDetails_link}  link=Personal details
${MobileHelp_xpath}   xpath=//span[contains(text(),'Mobile help')]
${Logout_link}  link=Logout

*** Keywords ***

Verify if the User number is displayed.
    ElEMENT TEXT SHOULD BE  ${USERdashboard_css}  0468 340 754

Verify if the MyDashboard link is displayed.
   ELEMENT SHOULD BE VISIBLE  ${MyDashboard_link}

Verify if the left menu contains all the expected items.
    Verify if "Plan" is in the left menu.
    Verify if "Payments" is in the left menu.
    Verify if "Payment Method" is in the left menu.
    Verify if "Personal Details" is in the left menu.
    Verify if "Mobile Help" is in the left menu.

Verify if "Plan" is in the left menu.
    ELEMENT SHOULD BE VISIBLE  ${Plan_xpath}

Verify if "Payments" is in the left menu.
    ELEMENT SHOULD BE VISIBLE  ${Payments_xpath}

Verify if "Payment Method" is in the left menu.
    ELEMENT SHOULD BE VISIBLE  ${PaymentMethod_link}

Verify if "Personal Details" is in the left menu.
    ELEMENT SHOULD BE VISIBLE  ${PersonalDetails_link}

Verify if "Mobile Help" is in the left menu.
    ELEMENT SHOULD BE VISIBLE  ${MobileHelp_xpath}

Verify if "Logout" is in displayed.
    ELEMENT SHOULD BE VISIBLE  ${Logout_link}

Logout user.
    WAIT UNTIL ELEMENT IS VISIBLE   ${Logout_link}
    CLICK ELEMENT  ${Logout_link}