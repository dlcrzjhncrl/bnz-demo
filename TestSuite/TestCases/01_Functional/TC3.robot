*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify If Payee Name and Account Number Are Mandatory Fields
    [Tags]    TC3 - Verify mandatory field in add payee modal
    Mx Execute Template With Multiple Data    Validate Payees Mandatory Fields    ${Functional_DatasetPath}    ${RowId}    NewPayees