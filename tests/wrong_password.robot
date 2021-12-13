*** Settings ***
Documentation       Test Case 3 - Typed wrong password
Library             SeleniumLibrary

*** Test Cases ***

Wrong Password
    # open browser
    Open Browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    wrong_password
    # click login button
    Click Button    login-button
    # check if wrong password error pops up
    Element Text Should Be    class:error-message-container    Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser
