*** Settings ***
Library    QWeb
Library           SeleniumLibrary    timeout=10    run_on_failure=Nothing
Resource          ../../Objects/Generic/Objects.txt
Resource          ../../TestData/Generic/Testdata.txt

*** Variables ***
${BROWSER}            Chrome

*** Keywords ***
User is on login page
    Qweb.GoTo    ${ROBOT_ENDPOINT}
  
User enters valid username password
    [Arguments]    ${user_name}    ${password}
    TypeText     Username    ${user_name}
    TypeSecret               Password    ${password}

User clicks on login button
       ClickText    Log In
       
Get Browser Console Log Entries
    [Arguments]    ${Test_suite_Screenshot_name}
    Capture Page Screenshot    ${Test_suite_Screenshot_name}    
    ${selenium}=    Get Library Instance    SeleniumLibrary
    ${webdriver}=    Set Variable     ${selenium._drivers.active_drivers}[0]
    ${log entries}=    Evaluate    $webdriver.get_log('browser')
    Log    ${log entries}    