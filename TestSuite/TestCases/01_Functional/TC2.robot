*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify If User Can Add Payee
    [Tags]    TC2 - Add new payee in the Payees page
    Mx Execute Template With Multiple Data    Add New Payee    ${Functional_DatasetPath}    ${RowId}    NewPayees
