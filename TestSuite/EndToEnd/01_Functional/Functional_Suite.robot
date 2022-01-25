*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot

*** Variables ***


*** Test Cases ***
Verify If User Can Navigate Payees Page
    [Tags]    TC1 -  Navigate to Payees Page via Navigation Menu
    Validate Payees Page Navigation
     
Verify If User Can Add Payee
    [Tags]    TC2 - Add new payee in the Payees page
    Mx Execute Template With Multiple Data    Add New Payee    ${Functional_DatasetPath}    ${RowId}    NewPayees

Verify If Payee Name and Account Number Are Mandatory Fields
    [Tags]    TC3 - Verify mandatory field in add payee modal
    Mx Execute Template With Multiple Data    Validate Payees Mandatory Fields    ${Functional_DatasetPath}    ${RowId}    NewPayees

Verify If Payee Name Can Be Sorted 
    [Tags]    TC4 - Verify that payees can be sorted by name 
    Validate Payees List Sorting

Verify If User Can Navigate And Transfer Balance In Payments Page
    [Tags]    TC5 - Navigate to Payments page
    Mx Execute Template With Multiple Data    Validate Balance Transfer    ${Functional_DatasetPath}    ${RowId}    Transfer

