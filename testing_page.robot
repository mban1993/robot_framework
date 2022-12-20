*** Settings ***
Documentation     SeleniumLibrary + RobotFramework usage test on webpage.
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${LOGIN URL}      http://the-internet.herokuapp.com/
${BROWSER}        Chrome

*** Test Cases ***
Checkboxes check
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[6]/a
      Click Element    xpath://*[@id="checkboxes"]/input[2]
      Checkbox Should Not Be Selected    xpath://*[@id="checkboxes"]/input[2]
      Close Browser
Authorization Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[3]/a
      Go To    http://admin:admin@the-internet.herokuapp.com/basic_auth
      Element Text Should Be    xpath://*[@id="content"]/div/p    Congratulations! You must have the proper credentials.
      Close Browser
Dropdown Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[11]/a
      Select From List By Label    id:dropdown    Option 2
      List Selection Should Be    id:dropdown    Option 2
      Close Browser
Dynamic Controls Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[13]/a
      Click Element    xpath://*[@id="input-example"]/button
      Wait Until Element Is Enabled    xpath://*[@id="input-example"]/input
      Input Text    xpath://*[@id="input-example"]/input    RobotFramework
      Capture Element Screenshot    xpath://*[@id="input-example"]/input    input.png
      Click Element    xpath://*[@id="input-example"]/button
      Wait Until Element Contains    xpath://*[@id="message"]    It's disabled!
      Element Text Should Be    xpath://*[@id="input-example"]/button    Enable
      Close Browser
Login Page Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[21]/a
      Input Text    xpath://*[@id="username"]    tomsmith
      Input Text    xpath://*[@id="password"]    SuperSecretPassword!
      Click Element    xpath://*[@id="login"]/button
      Element Text Should Be    xpath://*[@id="content"]/div/h2    Secure Area
      Close Browser
iFrames Text Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[22]/a
      Click Element    xpath://*[@id="content"]/div/ul/li[2]/a
      Sleep    2
      Select Frame     id:mce_0_ifr
      Input Text       xpath://*[@id="tinymce"]/p    *RobotFramework:Selenium - iFrames text input test*
      Capture Element Screenshot    xpath://*[@id="tinymce"]/p
      Element Text Should Be    xpath://*[@id="tinymce"]/p    *RobotFramework:Selenium - iFrames text input test*
      Close Browser
JQueryUI Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[28]/a
      Mouse Over    xpath://*[@id="ui-id-2"]
      Execute Javascript    document.getElementById('ui-id-4').click()
      Sleep    1
      Capture Page Screenshot    menu.png
      Execute Javascript    document.getElementById('ui-id-8').click()
      Close Browser
JS Alerts closing Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[29]/a
      ## JS Alert:
      Click Element    xpath://*[@id="content"]/div/ul/li[1]/button
      Alert Should Be Present    I am a JS Alert
      Capture Element Screenshot    //*[@id="result"]    jsalert_result.png
      Sleep    1
      ## JS Confirm:
      Click Element    xpath://*[@id="content"]/div/ul/li[2]/button
      Alert Should Be Present     I am a JS Confirm
      Capture Element Screenshot    //*[@id="result"]    jsconfirm_result.png
      Sleep    1
      ## JS prompt with text input:
      Click Element    xpath://*[@id="content"]/div/ul/li[3]/button
      Handle Alert    action=LEAVE
      Input Text Into Alert    RobotFramework:Selenium!!!
      Capture Element Screenshot    //*[@id="result"]    jsprompt_result.png
      Close Browser
Key pressing Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[31]/a
      Press Keys    id:target    SHIFT
      Element Text Should Be    xpath://*[@id="result"]    You entered: SHIFT
      Capture Element Screenshot    xpath://*[@id="result"]    key_pressing_result.png
      Close Browser
New tabs closing Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[33]/a
      Click Element    xpath://*[@id="content"]/div/a
      ${windowhandles}     Get Window Handles
      Switch Window       ${windowhandles}[1]
      ## Make sure new window was captured:
      Capture Element Screenshot    xpath:/html/body/div/h3    new_window.png
      close window
      Switch Window     ${windowhandles}[0]
      Close Browser
Button Clicking Test
      Open Browser     ${LOGIN URL}    ${BROWSER}
      Maximize Browser Window
      Click Element    xpath://*[@id="content"]/ul/li[2]/a
      Double Click Element    xpath://*[@id="content"]/div/button
      Double Click Element    xpath://*[@id="content"]/div/button
      Sleep    1
      Click Element    class:added-manually
      Click Element    class:added-manually
      Click Element    class:added-manually
      Click Element    class:added-manually
      Element Should Not Be Visible     xpath://*[@id="elements"]/button[1]
      Close Browser