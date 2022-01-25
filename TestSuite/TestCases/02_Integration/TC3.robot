*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify Post Request
    [Tags]    TC3 - Verify that the posted data are showing up in the result 
    Mx Execute Template With Multiple Data    Verify User Post    ${Integration_DatasetPath}    ${RowId}    API_TC3