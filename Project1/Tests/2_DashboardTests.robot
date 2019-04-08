##Author: Jeanica Fernandez
##Date Created: May 19, 2017
##Modified By:
##Date Modified:
##Changes Made:

*** Settings ***
Library    Selenium2Library
Resource  ../Resources/DashboardPage.robot
Resource  ../Resources/PersonalDetailsPage.robot

*** Variables ***
${INITIAL_PHONE}  0401177233
${INITIAL_EMAIL}  testuser@amaysim.com
${INVALID_PHONE}  invalid
${INVALID_EMAIL}  invalid
${VALID_PHONE}
${VALID_EMAIL}

*** Test Cases ***

Dashboard-000: Verify if the expected elements in the dahsboard are displayed.
    Verify if the User number is displayed.
    Verify if the MyDashboard link is displayed.
    Verify if the left menu contains all the expected items.
    Verify if "Logout" is in displayed.

Personal Details-000: Verify if the Personal Details section displays the expected elements.
    Open the Personal Details section.
    Verify if the Personal Info Section is labeled properly.
    Verify if the "Full name" and "Date of birth" are displayed wtih correct details.
    Verify if the "Change of Ownership" link is displayed.

Contact Info-000: Verify if the Contact Info section displays the expected elements.
    Verify if the Contact Info Section is labeled properly.
    Verify if the "Phone Number" and "Email Address" are displayed.
    Verify if "Phone Number" and "Email Address" data are correct.  ${INITIAL_PHONE}  ${INITIAL_EMAIL}

Contact Info-001: Verify if the Edit Contact Info section displays the expected elements.
    CLick the "Edit" link in Contact Info section.
    Verify if the Phone Number textfield is displayed.
    Verify if the Email Address textfield is displayed.
    Verify if "Save" in Edit Contact Info section is displayed.
    Verify if "Cancel" in Edit Contact Info section is displayed.

Contact Info-002: Unsuccessfully edit Contact Info by making no new changes.
    Input data in Phone Number text field.  ${INITIAL_PHONE}
    Input data in Email Address text field.  ${INITIAL_EMAIL}
    Click "Save" in Edit Contact Info section.
    Verify that an error message will be displayed if there are no new changes.
    Close Popup Window.

Contact Info-003: Unsuccessfully edit Contact Info by using invalid information.
    Input data in Phone Number text field.  ${INVALID_PHONE}
    Input data in Email Address text field.  ${INVALID_EMAIL}
    Click "Save" in Edit Contact Info section.
    Verify that an error message will be displayed if invalid data are supplied.

Contact Info-004: Unsuccessfully edit Contact Info by leaving email address empty.
    Input data in Phone Number text field.  ${INVALID_PHONE}
    Click "Save" in Edit Contact Info section.
    Verify that an error message will be displayed if email address is empty.

#Contact Info-005: Successfully edit Contact Info by using valid information.
#    Input data in Phone Number text field.  ${VALID_PHONE}
#    Input data in Email Address text field.  ${VALID_EMAIL}
#    Click "Save" in Edit Contact Info section.
#    Verify that a notification message will be displayed if the edit was successful.
#    Close Popup Window.
#    Verify if "Phone Number" and "Email Address" data are correct.  ${VALID_PHONE}  ${VALID_EMAIL}

Contact Info-006: Cancel Contact info edit.
    Click "Cancel" in Edit Contact Info section.

Password-000: Verify if the Password section displays the expected elements.
    Verify if the My Amaysim Password Section is labeled properly.
    Verify if the "Edit" link in Password section is displayed.

Password-001: Verify if the Edit Password section displays the expected elements.
    Click the "Edit" link in Password section.
    Verify if the Current Password textfield is displayed.
    Verify if the New Password textfield is displayed.
    Verify if the Confirm Password textfield is displayed.
    Verify if "Save" in Edit Password section is displayed.
    Verify if "Cancel" in Edit Password section is displayed.

Address-001: Verify if the Address section displays the expected elements.
    Verify if the Addresses section is labeled properly.
    Verify if the "Edit" link in Addresses - Residential is displayed.
    Verify if the "Edit" link in Addresses - Delivery is displayed.

Address-002: Verify if the Edit Residential Address section displays the expected elements.
    Click the "Edit" link in Addresses - Residential section.
    Verify if the Edit Residential address section displayed correct elements.

Address-003: Cancel Residentail address edit.
    Cancel Residentail address edit.



Logout: Logout user.
    Logout user.