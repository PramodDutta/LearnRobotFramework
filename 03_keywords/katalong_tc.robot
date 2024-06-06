# Created by promode at 06/06/24
*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close browser

*** Variables ***
${URL}     https://katalon-demo-cura.herokuapp.com/
${BROWSER}    Chrome

*** Test Cases ***
Verify Katalon Cura App.
    Open Browser to Katalon Demo App
    Press Make Appointment Button
    Enter username and password

*** Keywords ***

Open Browser to Katalon Demo App
    Open Browser     ${URL}    ${BROWSER}
    Title Should be     CURA Healthcare Service

Press Make Appointment Button
    Click Element    xpath://a[@id='btn-make-appointment']
    Wait Until Location Contains  https://katalon-demo-cura.herokuapp.com/profile.php#login
    Element Text Should be    //h2[normalize-space()='Login']    Login
    Capture Page Screenshot    selenium-screenshot-{index}.png


Enter username and password
    Input Username     John Doe
    Input Password     ThisIsNotAPassword
    Click on Submit
    Capture Page Screenshot    selenium-screenshot-{index}.png


Input Username
    [Arguments]    ${username}
    Input Text    xpath://input[@id='txt-username']    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    xpath://input[@id='txt-password']  ${password}

Click on Submit
    Click Button    xpath://button[@id='btn-login']