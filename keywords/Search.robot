*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://pantip.com/
${text_search}  automated testing

*** Keywords ***
Open Browser Pantip
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Search Input
    Input Text  id=search-box       ${text_search}
    Click Element   xpath=//*[@id="__next"]/div/div/div[1]/div/div/i

Validation Search   
    ${text}    Get Text   id=text-result
    Should Match Regexp     ${text}    ${text_search}

Log Post lists
    @{elementList}=  Get WebElements    id=list-change-view
        FOR  ${i}  IN  @{elementList}
        ${text}=  Get Text  ${i}
        Log to console  ${text}
    END