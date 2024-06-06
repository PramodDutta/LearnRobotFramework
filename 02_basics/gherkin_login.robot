# Created by promode at 06/06/24
*** Settings ***
Resource    resource.robot
Test Teardown    Close browser

*** Test Cases ***
Valid Login
    Given browser is opened to login page
    When user "admin@gmail.com" with password "password123"
    Then verify Error Message

*** Keywords ***
Browser is opened to login page
    Open browser to login page

User "${username}" with password "${password}"
    Input username    ${username}
    Input password    ${password}
    Click on Submit
    Click Button    id:js-login-btn