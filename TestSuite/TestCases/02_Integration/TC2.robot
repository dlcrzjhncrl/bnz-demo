*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot


*** Variables ***


*** Test Cases ***
Verify Get Users Request By Id
    [Tags]    TC2 - Verify if user with id 8 is Nicholas Runolfsdottir V 
    Mx Execute Template With Multiple Data    Verify Get Request By Id    ${Integration_DatasetPath}    ${RowId}    API_TC2