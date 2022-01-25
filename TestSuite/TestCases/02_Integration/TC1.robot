*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify Get Users Request
    [Tags]    TC1 -  Verify that there are 10 users in the results
    Mx Execute Template With Multiple Data    Verify Get Request And Number Of Records    ${Integration_DatasetPath}    ${RowId}    API_TC1 