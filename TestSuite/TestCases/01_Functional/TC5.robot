*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify If User Can Navigate And Transfer Balance In Payments Page
    [Tags]    TC5 - Navigate to Payments page
    Mx Execute Template With Multiple Data    Validate Balance Transfer    ${Functional_DatasetPath}    ${RowId}    Transfer
