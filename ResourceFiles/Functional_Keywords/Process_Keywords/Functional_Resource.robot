*** Settings ***
Resource   ../../../Configurations/BNZ_Import_File.robot


*** Keywords ***
Validate Payees Page Navigation
    [Documentation]    This keyword will validate if user can navigate to payees page.
    ...    @author: jdelacru    - 25JAN22
    Open BNZ Homepage
    Navigate to Menu    ${Dashboard_Payees_Menu_Button}
    Validate Page    ${Payees_Payees_Label}
    Close Browser
    
Add New Payee
    [Documentation]    This keyword will add new pay in payees page.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${DatasetPath}
    Open BNZ Homepage
    Navigate to Menu    ${Dashboard_Payees_Menu_Button}
    Add Payee Details    ${DatasetPath}[Payee_Name]    ${DatasetPath}[AccountNum_Bank]    ${DatasetPath}[AccountNum_Branch]    ${DatasetPath}[AccountNum_AccountNumber]    ${DatasetPath}[AccountNum_Suffix]
    Validate If Payee Is Added    ${DatasetPath}[Payee_Name]    ${DatasetPath}[AccountNum_Bank]    ${DatasetPath}[AccountNum_Branch]    ${DatasetPath}[AccountNum_AccountNumber]    ${DatasetPath}[AccountNum_Suffix]
    Close Browser

Validate Payees Mandatory Fields
    [Documentation]    This keyword will validate mandatory fields in add payee form.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${DatasetPath}
    Open BNZ Homepage
    Navigate to Menu    ${Dashboard_Payees_Menu_Button}
    Verify If Payee Name is Mandatory Field    ${DatasetPath}[Payee_Name]
    Verify If Account Number is Mandatory Field    ${DatasetPath}[AccountNum_Bank]    ${DatasetPath}[AccountNum_Branch]    ${DatasetPath}[AccountNum_AccountNumber]    ${DatasetPath}[AccountNum_Suffix]
    Close Browser
    
Validate Payees List Sorting
    [Documentation]    This keyword will sort the payee name list is payees page.
    ...    @author: jdelacru    - 25JAN22
    Open BNZ Homepage
    Navigate to Menu    ${Dashboard_Payees_Menu_Button}
    Validate Page    ${Payees_Payees_Label}
    ${PayeeList}    Save Payee Name To List
    Validate Payee List In Ascending Order    ${PayeeList}
    Validate Payee List In Descending Order    ${PayeeList}
    Close Browser

Validate Balance Transfer
    [Documentation]    This keyword will transfer balance from one account to another
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${DatasetPath}
    Open BNZ Homepage
    Navigate to Menu    ${Dashboard_PayTransfer_Menu_Button}
    Validate Page    ${Transfer_TransferPayment_Modal}
    Transfer Amount Balance    ${DatasetPath}[From_Account]    ${DatasetPath}[To_Account]    ${DatasetPath}[Transfer_Amount]
    Compute Current Balances After Transfer    ${DatasetPath}[Sender_Current_Bal]    ${DatasetPath}[Receiver_Current_Bal]    ${DatasetPath}[Transfer_Amount]
    Validate Current Balances After Transfer    ${DatasetPath}[From_Account]    ${DatasetPath}[To_Account]    ${DatasetPath}[SenderBalance_AfterTransfer]    ${DatasetPath}[ReceiverBalance_AfterTransfer]
    Close Browser
