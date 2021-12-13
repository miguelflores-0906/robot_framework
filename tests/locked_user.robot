*** Settings ***
Documentation       Test Case 2 - Unsuccessful user log in by a locked out user
Library             SeleniumLibrary

*** Test Cases ***

Locked User
    # open browser
    Open Browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # check if locked out error pops up
    Element Text Should Be    class:error-message-container    Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser
