*** Settings ***
Documentation       Test Case 1 - Successful User Log In
Library             SeleniumLibrary

*** Test Cases ***

A-Z
    # open browser
    Open Browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    # check if login page
    Page Should Contain Button    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # check if products page
    Element Text Should Be    class:title    PRODUCTS
    # click on selector
    Select From List By Value    class:product_sort_container    az
    Element Text Should Be    class:active_option    NAME (A TO Z)

Z-A
    Select From List By Value    class:product_sort_container    za
    Element Text Should Be    class:active_option    NAME (Z TO A)
Low-High
    Select From List By Value    class:product_sort_container    lohi
    Element Text Should Be    class:active_option    PRICE (LOW TO HIGH)
High-Low
    Select From List By Value    class:product_sort_container    hilo
    Element Text Should Be    class:active_option    PRICE (HIGH TO LOW)
    # close browser
    [Teardown]    Close Browser
