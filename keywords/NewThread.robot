*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://pantip.com/
${path_thread_menu}    //*[@id="__next"]/div/div/div[1]/div/ul[2]/a[2]
${path_question_thread}    //*[@id="3"]/a
${text_topic}   Automated testing คืออะไร

*** Keywords ***
Open Browser Pantip
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Click Login Menu
    Click Element   xpath=${path_login_menu}
Input Valid Email & Password
    Input Text    id=member_email    ${text_valid_email}
    Input Text    id=member_password    ${text_valid_password}
Click Login
    Click Element   xpath=${path_login_button}
Click Thread Menu
    Wait Until Page Contains Element   xpath=${path_thread_menu}
    Click Element   xpath=${path_thread_menu}
    #Switch Window
        ${handles}=  Get Window Handles
        Switch Window   ${handles}[0]
        Element Text Should Be  //*[@id="ptContainerMain"]/div[3]/div/div/nav/div/a  หน้าแรกพันทิป  timeout=5
        Switch Window  ${handles}[1]
        Element Text Should Be  //*[@id="type_post_form"]/div/div[1]/div/div/ul/li[3]  เลือกประเภทกระทู้  timeout=5
    Wait Until Page Contains Element   xpath=${path_question_thread}
    Click Element   ${path_question_thread}
Input 
    #TOPIC
    Input Text  id=topic    ${text_topic}
    #EMOJI
    Click Element   //*[@id="mceu_5-button"]/i
    sleep  3s
    Click Element   //*[@id="[:เพี้ยนขำหนักมาก:]"]/img
    Click Element   //*[@id="main-body-content"]/div[8]/div[1]/a/span
    #TAG
    Input Text  id=pt-tag-search    งานไอที
    Wait Until Page Contains Element    id=tag-8712
    Click Element   id=tag-8712
Click 
    Click Element   id=topic_save

    
    