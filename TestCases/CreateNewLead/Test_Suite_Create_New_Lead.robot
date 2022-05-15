*** Settings ***
Resource          ../../Keywords/CreateNewLead/Keywords.robot
Resource          ../../Keywords/Generic/Keywords.robot
Suite Teardown    Qweb.Close Browser
Test Teardown      Run Keyword If Test Failed    Get Browser Console Log Entries    GIP_IP_Blocks_Overview_${TEST NAME}.png
Suite Setup             QWeb.Open Browser    about:blank    ${BROWSER}

*** Test Cases ***
TC_01_Verify_Salesforce_Home_Page
    GIVEN User is on login page
    WHEN User enters valid username password    ${USERNAME}    ${PASSWORD}
    AND User clicks on login button
    THEN Salesforce home page is displayed
    
TC_02_Verify_New_Lead_Window_Is_Displayed
    GIVEN Salesforce home page is displayed
    WHEN User clicks on new lead
    THEN New lead window is displayed
    
TC_03_Create_New_Lead
    GIVEN New lead window is displayed
    WHEN User enters all required fields in new lead section    ${first_name}    ${last_name}    ${company}    ${email}
    AND User clicks on save button
    THEN New lead is created     ${email}

TC_04_Delete_Created_Lead
    GIVEN New lead is exist     ${email}
    WHEN User clicks on delete
    THEN Created lead should be deleted 

