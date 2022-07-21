*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://pantip.com/
${text_valid_email}    Test-test-333@hotmail.com
${text_valid_password}     tpassword001
${text_invalid_email}    Test-test-000@hotmail.com
${text_invalid_password}     tpassword333
${text_email_true}    Test-test-333@hotmail.com
${text_password_true}     tpassword001
${text_validation}    สมาชิกหมายเลข
${text_validation_email}    อีเมลหรือนามแฝงที่คุณป้อน ไม่ตรงกับบัญชีใดๆ
${text_validation_password}     รหัสผ่านไม่ถูกต้อง ลองอีกครั้งหรือคลิก “ลืมรหัสผ่าน“ เพื่อรีเซ็ตรหัส

${path_login_menu}    //*[@id="__next"]/div/div/div[1]/div/ul[2]/a[5]
${path_login_button}  //*[@id="__next"]/div/div/div[9]/div[1]/form/button
${path_profile_img}       //*[@class='pt-user__avatar pt-xl_nav']
${path_profile_menu}    //*[@id="ptListDropdownMenu"]/div/div[1]/a
${path_validation_text}     //*[@id="main-body-content"]/div[4]/div/div[1]/div[1]/div/div[1]/h3
${path_validation_email}    //*[@id="__next"]/div/div/div[9]/div[1]/form/section/label[1]/div[2]
${path_validation_password}     //*[@id="__next"]/div/div/div[9]/div[1]/form/section/label[2]/div

*** Keywords ***
Open Browser Pantip
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Click Login Menu
    Click Element   xpath=${path_login_menu}
Input Valid Email & Password
    Input Text    id=member_email    ${text_valid_email}
    Input Text    id=member_password    ${text_valid_password}
Input Invalid Email & Valid Password
    Input Text    id=member_email    ${text_invalid_email}
    Input Text    id=member_password    ${text_valid_password}
Input Valid Email & Invalid Password
    Input Text    id=member_email    ${text_valid_email}
    Input Text    id=member_password    ${text_invalid_password}
Click Login
    Click Element   xpath=${path_login_button}
Validation Login True
    Wait Until Page Contains Element  xpath=${path_profile_img}
    Click Element   xpath=${path_profile_img}
    Click Element   xpath=${path_profile_menu}
    ${text}    Get Text   ${path_validation_text} 
    Should Match Regexp     ${text}    ${text_validation}
Validation Login Invalid Email 
    Wait Until Page Contains Element    ${path_validation_email} 
    ${text}    Get Text   ${path_validation_email} 
    Should Match Regexp     ${text}    ${text_validation_email}
Validation Login Invalid Password
    Wait Until Page Contains Element    ${path_validation_password} 
    ${text}    Get Text   ${path_validation_password} 
    Should Match Regexp     ${text}    ${text_validation_password}

