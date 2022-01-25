*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify If Payee Name Can Be Sorted 
    [Tags]    TC4 - Verify that payees can be sorted by name 
    Validate Payees List Sorting