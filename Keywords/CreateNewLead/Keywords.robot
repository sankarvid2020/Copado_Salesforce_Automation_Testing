*** Settings ***
Library           String
Library           Collections
Library           DatabaseLibrary
Library           RequestsLibrary
Library           JSONLibrary
Library           CSVLib
Library           DateTime
Library           QWeb
Library           SeleniumLibrary
Library           ../../Libraries/Generic/Library.py 
Resource          ../../Objects/CreateNewLead/Objects.txt
Resource          ../../Objects/Generic/Objects.txt
Resource          ../../Keywords/Generic/Keywords.robot
Resource          ../../TestData/CreateNewLead/Testdata.txt

*** Keywords ***
Salesforce home page is displayed
    Verify Text    Home
        
User clicks on new lead
    Click Text    Leads Menu
    Click Text    New Lead
    
New lead window is displayed
    Verify Text    New Lead
    
User enters all required fields in new lead section
    [Arguments]    ${type_first_name}    ${type_last_name}    ${type_company}    ${type_email}
    Select option    ${lead_status_drop_down_obj}    ${lead_status}          
    TypeText                 First Name     ${type_first_name}
    TypeText                 Last Name      ${type_last_name}
    TypeText                 Company        ${type_company}
    TypeText                 Email          ${type_email}
    
Select option
    [Arguments]    ${locator}    ${dropdown_select}
    QWeb.Click Element    ${locator}
    Click Text    ${dropdown_select}
       
User clicks on save button
    Click Text    Save
    
New lead is created
    [Arguments]    ${user_email}
    Click Text    Cancel
    Verify Text    ${user_email}    20s    

New lead is exist
    [Arguments]    ${user_email}
    Verify Text    ${user_email}    20s
     
User clicks on delete 
    ClickText                Leads
    ClickCheckbox            Select item 1    on
    UseTable                 xpath\=//*[@id\='brandBand_1']/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/table[1]
    ClickCell                r1c10
    ClickText                Delete
    Verify Text    Are you sure you want to delete this lead?    
    ClickText                Delete
    
Created lead should be deleted
    Verify Text    0 items
     
       