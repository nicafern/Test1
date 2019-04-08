*** Settings ***
Library    Selenium2Library
Resource  ../Resources/DashboardPage.robot


*** Variables ***
${PDHeader_xpath}  xpath=//div[@class='ama-page-header']

##### Personal Info Section #####
${PersonalInfo_xpath}  xpath=//h2[contains(text(),'Personal Info')]
${PInamelabel_xpath}  xpath=//strong[contains(text(),'Full name')]
${PIname_xpath}  xpath=//div[contains(text(),'Test Auto Test Rspec')]
${PIDOBlabel_xpath}  xpath=//strong[contains(text(),'Date of birth')]
${PIDOB_xpath}  xpath=//div[contains(text(),'01 Jan 1969')]
${PICOOform_link}  link=Change of Ownership form.

##### Contact Info Section #####
${ContactInfo_css}  xpath=//h2[contains(text(),'Contact Info')]
${PhoneNumberlabel_xpath}  xpath=//strong[contains(text(),'Phone number')]
${PhoneNumber_css}  xpath=/html[1]/body[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]/div[2]
${EmailAddlabel_xpath}  xpath=//strong[contains(text(),'Email address')]
${EmailAdd_css}  css=div.row.margin-top:nth-child(3) > div.small-12.medium-5.columns:nth-child(2)
${NotVerified_css}  css=div.small-12.medium-4.small-margin-top.columns:nth-child(3) > span.grey
${NotVerified}  Not verified
${HowToVerify_link}  link=How to verify

# Contact Info Edit page
${EditContact_css}  id=edit_contacts
${PhoneNumerfield_css}  css=#my_amaysim2_client_daytime_phone
${Emailfield_css}  css=#my_amaysim2_client_email
${SavebuttonContact_xpath}  xpath=//input[@value='Save']
${CancelbuttonContact_xpath}  xpath=//a[@id='show_contacts']
${SuccessfulContactEdit_window_xpath}  xpath=//p[contains(text(),'Your details have been updated, you can now use yo')]
${SuccessfulContactEdit_window_message}  Your details have been updated, you can now use your updated email to log in to your My amaysim account.


# Contact Info Errors in Edit
${noChangeMade_popupWindow_css}  xpath=//p[contains(text(),'Please make your change first.')]
${noChangeMade_closebutton_css}  css=div.form_info_popup.reveal-modal.padding-none.open:nth-child(23) > a.close-reveal-modal
${invalidPhoneNumber_errormessage_css}  xpath=//span[contains(text(),'Please enter a valid contact number')]
${invalidEMail_errormessage_css}  xpath=//span[contains(text(),'Please enter a valid email address')]
${blankEMail_errormessage_css}  css=#my_amaysim2_client_email
${blankEmail_errormessage}  can't be blank


##### My Amaysim Password #####
${MyAmaysimPassword_xpath}  xpath=//h2[contains(text(),'My amaysim password')]
${MyAmaysimPasswordtext_css}  css=div.row.margin-to-:nth-child(2) > div.small-12.columns.padding-none

# My Amaysim Password Edit
${EditPassword_css}  css=#edit_password
${CurrentPasswordlabel_xpath}  xpath=//strong[contains(text(),'Current password')]
${CurrentPasswordfield_css}  css=#my_amaysim2_user_current_password
${NewPasswordlabel_xpath}  xpath=//strong[contains(text(),'New password')]
${NewPasswordfield_css}  css=#my_amaysim2_user_password
${ConfirmPasswordlabel_xpath}  xpath=//strong[contains(text(),'Confirm password')]
${ConfirmPasswordfield_css}  css=#my_amaysim2_user_password_confirmation
${SavebuttonPassword_xpath}  xpath=//input[@value='Save']
${CancelbuttonPassword_xpath}  xpath=//a[@id='show_password']


# My Amaysim Password Errors in Edit
${invalidCurrentPassword_popupwindow_css}  css=div.form_info_popup.reveal-modal.padding-none.open:nth-child(55) > p.popup-content
${invalidCurrentPassword_errormessage}  Current password is incorrect.
${notMatchingPassword_css}  css=div.small-12.medium-4.end.columns:nth-child(2) > span.error:nth-child(2)
${notMatchingPassword_errormessage}  Password and confirmation password were not identical.


##### My Addresses #####
${MyAddresses_xpath}  xpath=//h2[contains(text(),'My addresses')]
${Residentiallabel_xpath}  xpath=//strong[contains(text(),'Residential')]
${Residential_css}  css=div.small-9.columns.padding-left-none > div.small-12.medium-8.columns:nth-child(2)
${Deliverylabel_xpath}  xpath=//strong[contains(text(),'Delivery')]
${Delivery_css}  css=div.row div.small-9.columns.padding-left-none > div.small-12.medium-8.columns:nth-child(2)

# My Address Edit
${EditResidential_css}  css=#edit_residential
${EditResidentialLabel_css}  css=div.row:nth-child(3) div.small-12.medium-3.columns > label.bold
${EditResidentailLabel}  Residential
${EditPageins_css}  css=div.row:nth-child(4) > div.small-12.columns.margin-bottom-half:nth-child(1)
${EditPageins}  PO box cannot be used for residential address
${EditResidentailfield_css}  css=#edit_residential_address
${CancelEditResidental_css}  css=#cancel_edit_residential

${EditDelivery_css}  xpath=//a[@id='edit_delivery']
${EditDeliveryLabel_css}  css=div.row:nth-child(3) div.small-12.medium-3.columns > label.bold
${EditDeliveryLabel}  Delivery
${EditDeliveryfield_css}  css=#edit_delivery_address
${CancelEditDelivery_css}  xpath=//a[@id='cancel_edit_delivery']


${CLOSE_popup_css}  xpath=//div[@class='form_info_popup reveal-modal padding-none open']//a[@class='close-reveal-modal'][contains(text(),'×')]

*** Keywords ***

 Open the Personal Details section.
   WAIT UNTIL ELEMENT IS VISIBLE  ${PersonalDetails_link}
   CLICK ELEMENT  ${PersonalDetails_link}

#####################
### Personal Info ###
#####################
Verify if the Personal Info Section is labeled properly.
    WAIT UNTIL PAGE CONTAINS ELEMENT  ${PersonalInfo_xpath}
    ELEMENT SHOULD BE VISIBLE  ${PersonalInfo_xpath}

Verify if the "Full name" and "Date of birth" are displayed wtih correct details.
    ELEMENT SHOULD BE VISIBLE  ${PInamelabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${PIDOBlabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${PIname_xpath}
    ELEMENT SHOULD BE VISIBLE  ${PIDOB_xpath}

Verify if the "Change of Ownership" link is displayed.
    ELEMENT SHOULD BE VISIBLE  ${PICOOform_link}

####################
### Contact Info ###
####################
Verify if the Contact Info Section is labeled properly.
     WAIT UNTIL ELEMENT IS VISIBLE  ${ContactInfo_css}
     ELEMENT SHOULD BE VISIBLE  ${ContactInfo_css}

Verify if the "Phone Number" and "Email Address" are displayed.
    ELEMENT SHOULD BE VISIBLE  ${PhoneNumberlabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${EmailAddlabel_xpath}

Verify if "Phone Number" and "Email Address" data are correct.  [Arguments]  ${phone}  ${email}
   ELEMENT TEXT SHOULD BE  ${PhoneNumber_css}  ${phone}
   ELEMENT TEXT SHOULD BE  ${EmailAdd_css}  ${email}


## Edit Contact Info ##
Click the "Edit" link in Contact Info section.
    CLICK ELEMENT  ${EditContact_css}

Verify if the Phone Number textfield is displayed.
    ELEMENT SHOULD BE VISIBLE  ${PhoneNumerfield_css}

Verify if the Email Address textfield is displayed.
    ELEMENT SHOULD BE VISIBLE  ${Emailfield_css}

Verify if "Save" in Edit Contact Info section is displayed.
    ELEMENT SHOULD BE VISIBLE  ${SavebuttonContact_xpath}


Verify if "Cancel" in Edit Contact Info section is displayed.
    ELEMENT SHOULD BE VISIBLE  ${CancelbuttonContact_xpath}

Input data in Phone Number text field.  [Arguments]  ${phone}
    INPUT TEXT  ${PhoneNumerfield_css}  ${phone}

Input data in Email Address text field.  [Arguments]  ${email}
    INPUT TEXT  ${Emailfield_css}  ${email}

Click "Save" in Edit Contact Info section.
    CLICK ELEMENT  ${SavebuttonContact_xpath}

Click "Cancel" in Edit Contact Info section.
    CLICK ELEMENT  ${CancelbuttonContact_xpath}

Verify that an error message will be displayed if there are no new changes.
   WAIT UNTIL ELEMENT IS VISIBLE  ${noChangeMade_popupWindow_css}
   ELEMENT SHOULD BE VISIBLE  ${noChangeMade_popupWindow_css}

Verify that an error message will be displayed if invalid data are supplied.
    WAIT UNTIL ELEMENT IS VISIBLE  ${invalidPhoneNumber_errormessage_css}
    ELEMENT SHOULD BE VISIBLE  ${invalidPhoneNumber_errormessage_css}
    ELEMENT SHOULD BE VISIBLE  ${invalidEMail_errormessage_css}

Verify that an error message will be displayed if email address is empty.
    WAIT UNTIL ELEMENT IS VISIBLE  ${blankEMail_errormessage_css}
    ELEMENT SHOULD BE VISIBLE  ${blankEMail_errormessage_css}

Verify that a notification message will be displayed if the edit was successful.
    WAIT UNTIL ELEMENT IS VISIBLE  ${SuccessfulContactEdit_window_xpath}
    ELEMENT TEXT SHOULD BE  ${SuccessfulContactEdit_window_xpath}  ${SuccessfulContactEdit_window_message}

Close Popup Window.
   WAIT UNTIL ELEMENT IS VISIBLE  ${CLOSE_popup_css}
   CLICK ELEMENT  ${CLOSE_popup_css}

Verify that the new email address need to be verified.
       ELEMENT SHOULD BE VISIBLE  ${HowToVerify_link}

###########################
### My Amaysim Password ###
###########################
Verify if the My Amaysim Password Section is labeled properly.
     WAIT UNTIL ELEMENT IS VISIBLE  ${MyAmaysimPassword_xpath}
     ELEMENT SHOULD BE VISIBLE  ${MyAmaysimPassword_xpath}

Verify if the "Edit" link in Password section is displayed.
     ELEMENT SHOULD BE VISIBLE  ${EditPassword_css}

## Edit Password ##
Click the "Edit" link in Password section.
    CLICK ELEMENT  ${EditPassword_css}

Verify if the Current Password textfield is displayed.
    WAIT UNTIL ELEMENT IS VISIBLE  ${CurrentPasswordlabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${CurrentPasswordlabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${CurrentPasswordfield_css}

Verify if the New Password textfield is displayed.
    ELEMENT SHOULD BE VISIBLE  ${NewPasswordlabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${NewPasswordfield_css}

Verify if the Confirm Password textfield is displayed.
    ELEMENT SHOULD BE VISIBLE  ${ConfirmPasswordlabel_xpath}
    ELEMENT SHOULD BE VISIBLE  ${ConfirmPasswordfield_css}

Verify if "Save" in Edit Password section is displayed.
    ELEMENT SHOULD BE VISIBLE  ${SavebuttonPassword_xpath}

Verify if "Cancel" in Edit Password section is displayed.
    ELEMENT SHOULD BE VISIBLE  ${CancelbuttonPassword_xpath}


###############
## Addresses ##
###############
Verify if the Addresses section is labeled properly.
    WAIT UNTIL ELEMENT IS VISIBLE  ${MyAddresses_xpath}

Verify if the "Edit" link in Addresses - Residential is displayed.
     ELEMENT SHOULD BE VISIBLE  ${EditResidential_css}

Verify if the "Edit" link in Addresses - Delivery is displayed.
    ELEMENT SHOULD BE VISIBLE  ${EditDelivery_css}

## Edit Address
Verify if the Edit Residential address section displayed correct elements.
    ELEMENT TEXT SHOULD BE  ${EditResidentialLabel_css}  ${EditResidentailLabel}
    ELEMENT SHOULD BE VISIBLE  ${CancelEditResidental_css}

Verify if the Edit Delivery address section displayed correct elements.
    ELEMENT TEXT SHOULD BE  ${EditDeliveryLabel_css}  ${EditDeliveryLabel}
    ELEMENT SHOULD BE VISIBLE  ${CancelEditDelivery_css}

Click the "Edit" link in Addresses - Residential section.
    CLICK ELEMENT  ${EditResidential_css}

Click the "Edit" link in Addresses - Delivery section.
    CLICK ELEMENT  ${EditDelivery_css}

Cancel Residentail address edit.
     CLICK ELEMENT  ${CancelEditResidental_css}

Cancel Delivery address edit.
    CLICK ELEMENT  ${CancelEditDelivery_css}