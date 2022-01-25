*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify If User Can Navigate Payees Page
    [Tags]    TC1 -  Navigate to Payees Page via Navigation Menu
    Validate Payees Page Navigation