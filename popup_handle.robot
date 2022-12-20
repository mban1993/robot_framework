*** Settings ***
Documentation     Handle pop-up windows with RPA.Desktop's help.
Library           SeleniumLibrary
Library           BuiltIn
Library           RPA.Desktop

*** Variables ***
${LOGIN URL}      http://the-internet.herokuapp.com/
${BROWSER}        Chrome

*** Test Cases ***
Authorization Test
      Open Browser                        ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element                       xpath://*[@id="content"]/ul/li[3]/a
      Type Text                           admin
      RPA.Desktop.Press Keys              TAB
      Type Text                           admin
      RPA.Desktop.Press Keys              ENTER
      Wait Until Page Contains Element    xpath://*[@id="content"]/div/p
      Element Text Should Be              xpath://*[@id="content"]/div/p    Congratulations! You must have the proper credentials.
      Close Browser
