*** Settings ***
Documentation     Custom keywords usage.
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${LOGIN URL}      http://the-internet.herokuapp.com/
${BROWSER}        Chrome

*** Keywords ***
Open
    Open Browser     ${LOGIN URL}    ${BROWSER}
Maximize
    Maximize Browser Window
Click bottom checkbox    
    Click Element    xpath://*[@id="checkboxes"]/input[2]
Go to 'checkboxes' site
    Click Element    xpath://*[@id="content"]/ul/li[6]/a
Check if checkbox is unchecked
    Checkbox Should Not Be Selected    xpath://*[@id="checkboxes"]/input[2]
    

*** Tasks ***
Checkboxes check
      Open      
      Maximize
      Go to 'checkboxes' site
      Click bottom checkbox
      Check if checkbox is unchecked
      Close Browser