*** Settings ***
Resource   ../../../Configurations/BNZ_Import_File.robot


*** Keywords ***
Add Payee Details
    [Documentation]    This keyword is used to add details new payee in Payees page.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sPayeeName}    ${iBank}    ${iBranchCode}    ${iAccountNumber}    ${iSuffix}
    Wait Until Element Is Enabled    ${Payees_Add_Button}
    Click Element    ${Payees_Add_Button}
    Wait Until Page Contains Element    ${AddPayee_Modal}
    Wait Until Element Is Enabled    ${AddPayee_Name_Textbox}    
    Input Text    ${AddPayee_Name_Textbox}    ${sPayeeName}
    Click Element    ${AddPayee_Name_Dropdown}    
    Input Text    ${AddPayee_AcctNum_Bank_Textbox}    ${iBank}
    Input Text    ${AddPayee_AcctNum_BranchCode_Textbox}    ${iBranchCode}
    Input Text    ${AddPayee_AcctNum_AccountNumber_Textbox}    ${iAccountNumber}
    Input Text    ${AddPayee_AcctNum_Suffix_Textbox}    ${iSuffix}
    Click Element    ${AddPayee_Add_Button}
    ${Payee_Status}     Run Keyword and Return Status    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Element Should Be Visible    ${AddPayee_Added_Notification}
    Run Keyword If    ${Payee_Status}==${TRUE}    Run Keywords    Log    New Payee Successfully Added.    
    ...    AND    Take Screenshot    ELSE    Log    Payee is Not Added. Please double check the details.    level=ERROR

Validate If Payee Is Added
    [Documentation]    This keyword is used to validate if payee is added in Payees page.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sPayeeName}    ${iBank}    ${iBranchCode}    ${iAccountNumber}    ${iSuffix}
    ${iAccountNum}    Catenate    SEPARATOR=-    ${iBank}    ${iBranchCode}    ${iAccountNumber}    ${iSuffix}
    ${Payees_PayeeExist_ListItem}    Replace Variables    ${Payees_PayeeExist_ListItem}
    Input Text    ${Payees_Search_Textbox}    ${sPayeeName}
    ${Payee_Status}    Run Keyword and Return Status    Page Should Contain Element    ${Payees_PayeeExist_ListItem}
    Run Keyword If    ${Payee_Status}==${TRUE}    Log    Payee record found.
    ...    ELSE    Log    Payee record not found.    level=ERROR
    Take Screenshot
    
Verify If Payee Name is Mandatory Field
    [Documentation]    This keyword is used to verify if the Payee Name is Mandatory Field in Add Payee Modal.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sPayeeName}
    ${isName}    Set Variable    ${TRUE}
    Wait Until Element Is Enabled    ${Payees_Add_Button}
    Click Element    ${Payees_Add_Button}
    Wait Until Page Contains Element    ${AddPayee_Modal}
    Wait Until Element Is Enabled    ${AddPayee_Name_Textbox}   
    Validate Add Payee Mandatory Field    ${AddPayee_Add_Button}    ${AddPayee_Name_Textbox}    ${sPayeeName}    ${AddPayee_Name_Mandatory_ErrMsg}    ${isName}
    
Verify If Account Number is Mandatory Field
    [Documentation]    This keyword is used to verify mandatory fields for account number in Add Payee Modal.
    ...   @author: jdelacru    - 25JAN22
    [Arguments]    ${iBank}    ${iBranchCode}    ${iAccountNumber}    ${iSuffix}
    Wait Until Element Is Enabled    ${AddPayee_AcctNum_Bank_Textbox}
    Validate Add Payee Mandatory Field    ${AddPayee_Add_Button}    ${AddPayee_AcctNum_Bank_Textbox}    ${iBank}    ${AddPayee_AcctNum_Bank_Mandatory_ErrMsg}
    Validate Add Payee Mandatory Field    ${AddPayee_Add_Button}    ${AddPayee_AcctNum_BranchCode_Textbox}    ${iBranchCode}    ${AddPayee_AcctNum_BranchCode_Mandatory_ErrMsg}
    Validate Add Payee Mandatory Field    ${AddPayee_Add_Button}    ${AddPayee_AcctNum_AccountNumber_Textbox}    ${iAccountNumber}    ${AddPayee_AcctNum_AccountNumber_Mandatory_ErrMsg}
    Validate Add Payee Mandatory Field    ${AddPayee_Add_Button}    ${AddPayee_AcctNum_Suffix_Textbox}    ${iSuffix}    ${AddPayee_AcctNum_Suffix_Mandatory_ErrMsg}

Validate Add Payee Mandatory Field
    [Documentation]    This keyword is used to validate warning message in mandatory field in payee page.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sButton_Locator}    ${sInput_Textfield_Locator}    ${sTextValue}    ${sErrorMessage_Visible_Locator}   ${isName}=False 
    Click Element    ${sButton_Locator}
    ${Blank_Status}    Run Keyword and Return Status    Page Should Contain Element    ${sErrorMessage_Visible_Locator}
    Run Keyword If    ${Blank_Status}==${TRUE}    Log    Warning message for Mandatory Text Field is Visible.
    Take Screenshot
    Input Text    ${sInput_Textfield_Locator}    ${sTextValue}
    Run Keyword If    ${isName}==${TRUE}    Click Element    ${AddPayee_Name_Dropdown}
    ${Filled_Status}    Run Keyword and Return Status    Page Should Not Contain Element    ${sErrorMessage_Visible_Locator}
    Run Keyword If    ${Filled_Status}==${TRUE}    Log    Warning message for Mandatory Text Field is Removed.
    Take Screenshot
     
Transfer Amount Balance
    [Documentation]    This keyword is used to transfer balance from one account to another account and save their current balances in excel.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSender}    ${sReceiver}    ${iTransferAmount}
    ###SENDER###
    Populate Transfer Details    ${Transfer_From_Button}    ${Transfer_Modal_From_Label}    ${sSender}    ${Transfer_From_CurrentBal_Label}    Sender_Current_Bal
    ###RECEIVER###
    Populate Transfer Details    ${Transfer_To_Button}    ${Transfer_Modal_To_Label}   ${sReceiver}    ${Transfer_To_CurrentBal_Label}    Receiver_Current_Bal
    ###TRANSFER AMOUNT###
    Input Text    ${Transfer_Amount_Textbox}    ${iTransferAmount}
    Click Element    ${Transfer_Transfer_Button}
    ${Transfer_Status}     Run Keyword and Return Status    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Element Should Be Visible    ${Transfer_TransferSuccess_Notification}
    Run Keyword If    ${Transfer_Status}==${TRUE}    Run Keywords    Log    Transfer Successful.    
    ...    AND    Take Screenshot    ELSE    Log    Transfer Failed. Please double check the details.    level=ERROR

Populate Transfer Details
    [Documentation]    This keyword is used to populate transfer details in transfer payment modal and write current balance in excel.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sAccountLocator}    ${sSearchAccount_Locator}    ${sPayeeName}    ${sCurrentBal_Locator}    ${sColumnName}
    Wait Until Element Is Enabled    ${sAccountLocator}    
    Click Element    ${sAccountLocator}
    Wait Until Element Is Visible    ${sSearchAccount_Locator}
    Input Text    ${Transfer_Search_Textbox}    ${sPayeeName}
    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Element Should Not Be Visible    ${Transfer_Result_SecondItem_Button}
    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Wait Until Element Is Not Visible    ${Transfer_Result_SecondItem_Button}
    Wait Until Element Is Enabled    ${Transfer_Result_Button}    
    Click Element    ${Transfer_Result_Button}
    ${CurrentBal}    Get And Convert Balance To Number    ${sCurrentBal_Locator}    1    -5
    Log    Current Balance is ${CurrentBal}
    Write Data To Excel    Transfer    ${sColumnName}    ${RowId}    ${CurrentBal}    ${Functional_DatasetPath}
    Wait Until Element Is Visible    ${Transfer_Amount_Textbox}

Compute Current Balances After Transfer
    [Documentation]    This keyword is used to compute Sender's and Receiver's current balances after the transfer and writes them to excel.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${iSenderCurrent_Bal}    ${iReceiverCurrent_Bal}    ${iTransfer_Amount} 
    ${SenderBalance_AfterTransfer}    Evaluate    ${iSenderCurrent_Bal}-${iTransfer_Amount}
    ${ReceiverBalance_AfterTransfer}    Evaluate    ${iReceiverCurrent_Bal}+${iTransfer_Amount}
    Log    Current Balance of Sender After Transfer is ${SenderBalance_AfterTransfer}
    Log    Current Balance of Receiver After Transfer is ${ReceiverBalance_AfterTransfer}
    Write Data To Excel    Transfer    SenderBalance_AfterTransfer    ${RowId}    ${SenderBalance_AfterTransfer}    ${Functional_DatasetPath}
    Write Data To Excel    Transfer    ReceiverBalance_AfterTransfer    ${RowId}    ${ReceiverBalance_AfterTransfer}    ${Functional_DatasetPath}

Validate Current Balances After Transfer
    [Documentation]    This keyword is used to validate current balances of sender and receiver after transfer.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSender}    ${sReceiver}    ${iSenderBal_AfterTransfer}    ${iReceiverBal_AfterTransfer}
    ${Dashboard_Sender_Profile_Icon}    Replace Variables    ${Dashboard_Sender_Profile_Icon} 
    ${Dashboard_Receiver_Profile_Icon}    Replace Variables    ${Dashboard_Receiver_Profile_Icon} 
    Validate Page    ${Dashboard_Loaded}
    ${Sender_CurrentBal_FromUI}    Get Current Balance From Dashboard    ${Dashboard_Sender_Profile_Icon}    ${AccountDetails_CurrentBalance_Text}
    ${Receiver_CurrentBal_FromUI}    Get Current Balance From Dashboard    ${Dashboard_Receiver_Profile_Icon}    ${AccountDetails_CurrentBalance_Text}
    
    ${SenderBal_Status}    Run Keyword and Return Status    Should Be Equal As Numbers    ${iSenderBal_AfterTransfer}    ${Sender_CurrentBal_FromUI}
    Run Keyword If    ${SenderBal_Status}==${TRUE}    Log    Correct! The computed and expected current balances for sender are the same.
    ...    ELSE    Log    Incorrect! The computed and expected current balances for sender are not the same.    level=ERROR
  
    ${ReceiverBal_Status}    Run Keyword and Return Status    Should Be Equal As Numbers    ${iReceiverBal_AfterTransfer}    ${Receiver_CurrentBal_FromUI}
    Run Keyword If    ${SenderBal_Status}==${TRUE}    Log    Correct! The computed and expected current balances for receiver are the same.
    ...    ELSE    Log    Incorrect! The computed and expected current balances for receiver are not the same.    level=ERROR
    
Get Current Balance From Dashboard
    [Documentation]    This keyword is used to get the current balance of customer from account details and convert them to number.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sProfile_Locator_Icon}    ${iCurrent_Balance_Locator}
    Click Element    ${sProfile_Locator_Icon}
    ${Current_Balance}    Get And Convert Balance To Number    ${iCurrent_Balance_Locator}
    Click Element    ${AccountDetails_Close_Button}
    [Return]    ${Current_Balance}

Save Payee Name To List
    [Documentation]    This keyword is used to count the payees count element in payees page.
    ...    @author: jdelacru    - 25JAN22
    ${Element_Count}    SeleniumLibraryExtended.Get Element Count    ${Payees_ListCountItem_ListItem}
    ${Payee_List}    Create List    
    FOR    ${i}    IN RANGE    1    ${ElementCount}+1
        ${Payee_Name}    Get Text    //ul[@class="List List--border"]//div[@id="js-payee-item-${i}"]//span[@class="js-payee-name"]
        Append To List    ${PayeeList}    ${Payee_Name}
    END
    [Return]    ${PayeeList}
    
Validate Payee List In Ascending Order
    [Documentation]    This keyword is used to validate that payee list is sorted in ascending order.
    [Arguments]    ${PayeeList}
    Validate Payee List Order    ${Payees_SortAsc_Icon}    ${PayeeList}    

Validate Payee List In Descending Order
    [Documentation]    This keyword is used to validate that payee list is sorted in descending order.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${PayeeList}
    ${iSDesc}    Set Variable    ${TRUE}
    Validate Payee List Order     ${Payees_SortDesc_Icon}    ${PayeeList}    ${iSDesc}
    
Validate Payee List Order
    [Documentation]    This keyword is used to sort payees list in ascending or descending order.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sPayeeOrder_Icon}    ${PayeeList}    ${sIsDesc}=False    
    FOR    ${i}    IN RANGE    20
        ${Status}    Run Keyword and Return Status    Page Should Contain Element   ${sPayeeOrder_Icon}
        Run Keyword If    ${Status}==${TRUE} and ${sIsDesc}==${FALSE}    Exit For Loop
        ...    ELSE IF    ${Status}==${FALSE} and ${sIsDesc}==${TRUE}    Run Keywords    Click Element    ${Payees_Sort_Icon}    
        ...    AND    Page Should Contain Element   ${sPayeeOrder_Icon}
        ...    AND    Exit For Loop
    END  
    Log     ${PayeeList}
    Sort List    ${PayeeList}
    Run Keyword If    ${sIsDesc}==${TRUE}    Reverse List    ${PayeeList}
    Log    ${PayeeList}
    ${ElementCount}    Get Length    ${PayeeList}
    ${PayeeList_UI}    Create List
    FOR    ${i}    IN RANGE    0    ${ElementCount}
        ${PayeeName}    Get From List     ${PayeeList}    ${i}
        Log    ${PayeeName}
        ${id}    Evaluate    ${i}+1
        ${TextValue}    Get Text    //li[${id}]//span[@class="js-payee-name"]
        Append To List    ${PayeeList_UI}    ${TextValue}
    END
    Log    Sorted Payee List Value is ${PayeeList}
    Log    Payee Order in UI is ${PayeeList_UI}
    ${Status}    Run Keyword And Return Status    Lists Should Be Equal    ${PayeeList_UI}    ${PayeeList}
    Run Keyword If    ${Status}==${TRUE}    Log    Sorting is Correct. Expected sequence of items from list and ui are match.
    ...    ELSE    Log    Sorting is Incorrect. Expected sequence of items from list and ui are not match.
    
