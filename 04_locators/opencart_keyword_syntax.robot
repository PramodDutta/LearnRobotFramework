# Lets Automate the Registeration of the Opencart


*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close browser
Library    DateTime

** Variables ***
${URL}     https://awesomeqa.com/ui/index.php?route=account/register
${BROWSER}    Chrome


*** Test Cases ***
Verify that user is able to register.
    Open the BROWSER and Navigate to URL.
    Enter the Fields FirstName, LastName, Email, Telephone.
    Enter the Passsord, Confirm Password.
    Click the Newsletter radio box to Yes.
    Check the Privacy policy checkbox.
    Verify that new Page is loaded with Message "Your Account Has Been Created!".
    Click on the Continue button, You will Account Page.

*** Keywords ***

Open the BROWSER and Navigate to URL.
    Open Browser     ${URL}    ${BROWSER}
    Title Should be     Register Account

Enter the Fields FirstName, LastName, Email, Telephone.
    Wait Until Element Is Visible   xpath://input[@id='input-firstname']
    Input Text  xpath://input[@id='input-firstname']    Aman
    Input Text  xpath://input[@id='input-lastname']    Sharma
    ${timestamp} =    Get Current Date    result_format=%H%M%S
    Input Text  xpath://input[@name="email"]    abc${timestamp}@gmail.com
    Input Text  xpath://input[@id='input-telephone']    9876543210

Enter the Passsord, Confirm Password.
    Input Text  xpath://input[@id='input-password']   1234
    Input Text  xpath://input[@id='input-confirm']   1234

Click the Newsletter radio box to Yes.
    Click Element  xpath://label[normalize-space()='Yes']
    Click Element  xpath://input[@name='agree']

Check the Privacy policy checkbox.
    Click Element  xpath://input[@value='Continue']

Verify that new Page is loaded with Message "Your Account Has Been Created!".
    Wait Until Location Contains    https://awesomeqa.com/ui/index.php?route=account/success
    Sleep    2s
Click on the Continue button, You will Account Page.
    Click Element  xpath://a[normalize-space()='Continue']
    Sleep    2s
    Element Should Contain    xpath://h2[normalize-space()='My Account']    My Account

