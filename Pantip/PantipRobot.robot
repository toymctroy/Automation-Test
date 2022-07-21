*** Settings ***
Library     SeleniumLibrary
Resource    ${CURDIR}/../keywords/imports.robot

*** Test Cases ***
#TC_Login_01
Test Login Valid Information
    Login.Open Browser Pantip
    Login.Click Login Menu
    Login.Input Valid Email & Password
    Login.Click Login
    Login.Validation Login True
    Close Browser
Test Login With Invalid Email
    Login.Open Browser Pantip
    Login.Click Login Menu
    Login.Input Invalid Email & Valid Password
    Login.Click Login
    Login.Validation Login Invalid Email 
    Close Browser
Test Login With Invalid Password
    Login.Open Browser Pantip
    Login.Click Login Menu
    Login.Input Valid Email & Invalid Password
    Login.Click Login
    Login.Validation Login Invalid Password 
    Close Browser

#TC_Topic_01
Test New Thread
     Login.Open Browser Pantip
     Login.Click Login Menu
     Login.Input Valid Email & Password
     Login.Click Login
     NewThread.Click Thread Menu
     NewThread.Input
     NewThread.Click 
     Close All Browser

#TC_Search_01
Test Search
     Search.Open Browser Pantip
     Search.Search Input
     Search.Validation Search 
     Search.Log Post lists
     Close Browser






