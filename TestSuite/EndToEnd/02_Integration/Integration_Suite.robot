*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot

*** Variables ***


*** Test Cases ***
Verify Get Users Request
    [Tags]    TC1 -  Verify that there are 10 users in the results
    Mx Execute Template With Multiple Data    Verify Get Request And Number Of Records    ${Integration_DatasetPath}    ${RowId}    API_TC1 
     
Verify Get Users Request By Id
    [Tags]    TC2 - Verify if user with id 8 is Nicholas Runolfsdottir V 
    Mx Execute Template With Multiple Data    Verify Get Request By Id    ${Integration_DatasetPath}    ${RowId}    API_TC2

Verify Post Request
    [Tags]    TC3 - Verify that the posted data are showing up in the result 
    Mx Execute Template With Multiple Data    Verify User Post    ${Integration_DatasetPath}    ${RowId}    API_TC3
