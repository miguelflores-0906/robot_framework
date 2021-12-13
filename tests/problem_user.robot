*** Settings ***
Documentation       Test Case 4 - Logged in as problem user and sees a broken inventory page
Library             SeleniumLibrary


*** Variables  ***
${dog}    /static/media/sl-404.168b1cce.jpg

*** Test Cases ***

Problem User
    # open browser
    Open Browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    problem_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # check if broken page
    Set Selenium Implicit Wait    2 seconds
    Page Should Contain Image    ${dog}
    # Element Should Be Visible    ${dog}
    # ${src}=    Get Element Attribute    ${dog}    /static/media/sl-404.168b1cce.jpg
    # Go To    ${src}
    # Wait Until Element Is Visible    css: img
    # close browser
    [Teardown]    Close Browser
