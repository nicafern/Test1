*** Settings ***
Library   Selenium2Library
Resource  ../Resources/LoginPage.robot


*** Variables ***
${URL}  https://www.amaysim.com.au/
${BROWSER}  chrome
${INVALID_USERNAME}  invalid
${INVALID_PASSWORD}  invalid
${VALID_USERNAME}  0468340754
${VALID_PASSWORD}  theHoff34
${INVALID_USER_MESSAGE}  Please enter a complete email address e.g. john.smith@mail.com.au


*** Test Cases ***
LoginPage-000: Verify if the Login link is displayed on the webpage.
   Launch browser  ${URL}  ${BROWSER}
   ELEMENT SHOULD BE VISIBLE  xpath=//span[contains(text(),'Login')]
   CLICK ELEMENT  xpath=//span[contains(text(),'Login')]

LoginPage-001: Verify if the elements in the Login page were displayed completely and correctly.
    Verify if username textfield is displayed.
    Verify if the password textfield is displayed.
    Verify if the login button is displayed.
    Verify if the forgot password link is displayed.


Login-001: Unsuccessfully log in as an Agent using invalid credentials.
    Input login credentials [Arguments] ${INVALID_USERNAME} ${INVALID_PASSWORD}
    ELEMENT TEXT SHOULD BE  css=div.form-row:nth-child(5) > small.form-inline-message.error  ${INVALID_USER_MESSAGE}  message="Incorrect error message."
    Click Login button

Login-002: Unsuccessfully log in as an Agent using an invalid username but correct password.
    Input login credentials [Arguments] ${INVALID_USERNAME} ${VALID_PASSWORD}
    Click Login button

Login-003: Unsuccessfully log in as an Agent using a valid username but incorrect password.
    Input login credentials [Arguments] ${VALID_USERNAME} ${INVALID_PASSWORD}
    Click Login button

Login-004: Successfully log in the application using valid credentials.
    Input login credentials [Arguments] ${VALID_USERNAME} ${VALID_PASSWORD}
    Click Login button
    CAPTURE PAGE SCREENSHOT  filename=SuccessfulLogin.png