# Created by promode at 06/06/24
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}     https://app.vwo.com
${BROWSER}    Chrome

*** Keywords ***

Open Browser to Login Page
    Open Browser     ${URL}    ${BROWSER}
    Title Should be     Login - VWO

Input Username
    [Arguments]    ${username}
    Input Text    name:username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    name:password   ${password}

Click on Submit
    Click Button    id:js-login-btn

Verify Error Message
    Sleep    3 seconds
    Element Should Be Visible    id:js-notification-box-msg
    Element Text Should Be    id:js-notification-box-msg    Your email, password, IP address or location did not match