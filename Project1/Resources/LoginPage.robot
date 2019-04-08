*** Settings ***
Library  Selenium2Library


*** Variables ***
###### needs to be updated if element properties were changed
${USER_TEXTFIELD}  username
${PASSWORD_TEXTFIELD}  password
${BUTTON}  button
${FORGOTPASSWORD_LINK}  Forgot password?

*** Keywords ***
Launch browser  [Arguments]  ${URL}  ${BROWSER}
    #Open browser with maximized window.
    OPEN BROWSER  ${URL}  ${BROWSER}

Verify if username textfield is displayed.
    WAIT UNTIL ELEMENT IS VISIBLE  id=${USER_TEXTFIELD}
    ELEMENT SHOULD BE VISIBLE  id=${USER_TEXTFIELD}

Verify if the password textfield is displayed.
    ELEMENT SHOULD BE VISIBLE  id=${PASSWORD_TEXTFIELD}

Verify if the login button is displayed.
    ELEMENT SHOULD BE VISIBLE  name=${BUTTON}

Verify if the forgot password link is displayed.
    ELEMENT SHOULD BE VISIBLE  link=${FORGOTPASSWORD_LINK}

Input login credentials [Arguments] ${U} ${P}
    ##Input username and password in login page.
    SET SELENIUM SPEED  0.25
    CLEAR ELEMENT TEXT  id=${USER_TEXTFIELD}
    INPUT TEXT  id=${USER_TEXTFIELD}  ${U}
    CLEAR ELEMENT TEXT  id=${PASSWORD_TEXTFIELD}
    INPUT PASSWORD  id=${PASSWORD_TEXTFIELD}  ${P}

Click login button
    ##Click the Login button in the login page.
    CLICK BUTTON  name=${BUTTON}


