*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot

*** Keywords ***
Open BNZ Homepage
    [Documentation]    This keyword will open BNZ Homepage.
    ...    @author: jdelacru
    Open Browser    ${BNZ_URL}    ${BROWSER}
    Maximize Browser Window
    ${Status}     Run Keyword and Return Status    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Wait Until Page Contains Element    ${Dashboard_Loaded}
    Run Keyword If    ${Status} == ${TRUE}    Log    Page Successfully Loaded.
    ...    ELSE    Log    Unable to load the Home Page.    level=ERROR

Navigate To Menu
    [Documentation]    This keyword is used to navigate any options from menu.
    ...    @author: jdelacru
    [Arguments]    ${OptionsMenu_Locator}
    Click Element    ${Dashboard_Menu_Button}
    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Element Should Be Visible    ${Dashboard_BNZ_Logo}        
    Click Element    ${OptionsMenu_Locator}

Validate Page
    [Documentation]    This keyword is use to validate a page by finding the given locator.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sValidate_Locator}
    ${Status}     Run Keyword and Return Status    Wait Until Keyword Succeeds    ${RETRY}    ${RETRY_INTERVAL}    Wait Until Element Is Visible    ${sValidate_Locator}
    Run Keyword If    ${Status} == ${TRUE}    Log    Page Successfully Loaded.
    ...    ELSE    Log    Unable to load the Page.    level=ERROR   

Get And Convert Balance To Number
    [Documentation]    This keyword is use to get the amount on the given locator and convert it to number.
    [Arguments]    ${sCurrentBal_Locator}    ${iIgnore_First}=None    ${iIgnore_Last}=None
    ${CurrentBal_Value}    Get Text    ${sCurrentBal_Locator}
    Log    Current Balance is ${CurrentBal_Value}
    ${SubString_CurrentBal}    Run Keyword If    ${iIgnore_First}!=None and ${iIgnore_Last}!=None    Get Substring    ${CurrentBal_Value}    ${iIgnore_First}    ${iIgnore_Last}
    ...    ELSE    Set Variable    ${CurrentBal_Value}
    Log    Current Balance is ${SubString_CurrentBal}
    ${Status}    Run Keyword And Return Status    Should Contain    ${SubString_CurrentBal}    ,
    ${CurrentBal_NoComma}    Run Keyword If    ${Status}==${TRUE}    Remove String    ${SubString_CurrentBal}    ,
    ...    ELSE    Set Variable    ${SubString_CurrentBal}
    ${CurrentBal}    Convert To Number    ${CurrentBal_NoComma}  
    Log    Current Bal is ${CurrentBal}
    [Return]    ${CurrentBal}


Write Data To Excel
    [Documentation]    This keyword is used to Write Data To Excel.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${rowid}    ${newValue}   ${sFilePath}    ${multipleValue}=N    ${bTestCaseColumn}=False
    ...    ${sColumnReference}=Test_Case
    
    ### Open Excel
    Open Excel Document    ${sFilePath}    0

    ### Write Values
    Run Keyword If    '${multipleValue}'=='Y'    Write Data To All Column Rows    ${sSheetName}    ${sColumnName}    ${newValue}
    ...    ELSE IF    '${multipleValue}'=='N'    Write Data To Cell    ${sSheetName}    ${sColumnName}    ${rowid}    ${newValue}    ${bTestCaseColumn}    ${sColumnReference}
    
    ### Save and Close Document
    Save Excel Document    ${sFilePath}
    Close Current Excel Document
    
Read Data From Excel
    [Documentation]    This keyword will be used for dynamically reading of Excel File supported by Python 3
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${rowid}   ${sFilePath}    ${readAllData}=N    ${bTestCaseColumn}=True    ${sTestCaseColReference}=rowid
    ### Open Excel
    Open Excel Document    ${sFilePath}    0
    
    Log    (Read Data From Excel) sTestCaseColReference = '${sTestCaseColReference}'

    ### Read Values
    ${sData}    Run Keyword If    '${readAllData}'=='Y'    Read Data From All Column Rows    ${sSheetName}    ${sColumnName}
    ...    ELSE IF    '${readAllData}'=='N'    Read Data From Cell    ${sSheetName}    ${sColumnName}    ${rowid}    ${bTestCaseColumn}    ${sTestCaseColReference}

    Log    Excel Date Read from Excel : '${sData}'
    ### Close File and Return Value
    Close Current Excel Document
    [Return]    ${sData}
  
Read Data From All Column Rows
    [Documentation]    This keyword will be used for reading data from all rows of a specified column.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}

    ${ColumnHeader_Index}    Get Index of a Column Header Value    ${sSheetName}    ${sColumnName}
    ${Column_Data}    Read Excel Column    ${ColumnHeader_Index}    0    ${sSheetName}
    Remove Values From List    ${Column_Data}    ${sColumnName}

    [Return]    ${Column_Data}
    
Write Data To Cell
    [Documentation]    This keyword will be used for writing data to single excel cell.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${rowid}    ${sData}    ${bTestCaseColumn}    ${sColumnReference}=Test_Case

    Log    ${sColumnReference}
    ${TestCaseHeader_Index}    ${ColumnHeader_Index}    Get Column Header Index    ${sSheetName}    ${sColumnName}    ${bTestCaseColumn}    ${sColumnReference}
    ${RowId_Index}    Get Index of a Row Value using a Reference Header Index    ${sSheetName}    ${rowid}    ${TestCaseHeader_Index}
    Write Excel Cell    ${RowId_Index}    ${ColumnHeader_Index}    ${sData}    ${sSheetName}
    
Write Data To All Column Rows
    [Documentation]    This keyword will be used for writing data to all rows of a specified column.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${sData}

    ${ColumnHeader_Index}    Get Index of a Column Header Value    ${sSheetName}    ${sColumnName}
    ${Row_Count_Total}    Read Excel Column    ${ColumnHeader_Index}    0    ${sSheetName}
    Write Excel Column    ${ColumnHeader_Index}    ${Row_Count_Total}    ${sData}    1    ${sSheetName}
    
Get Index of a Column Header Value
    [Documentation]    This keyword is used to get the index of a column header value at the Excel Sheet.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${bTestCaseColumn}=False

    ${DataColumn_List}    Read Excel Row    1    sheet_name=${sSheetName}
    Log    Data Set Sheet Name: '${sSheetName}'
    Log    Data Set Sheet Column Names: '${DataColumn_List}'

    ### Get Target Column Value Index ###
    ${ColumnName_Index}    Get Index From List    ${DataColumn_List}    ${sColumnName}
    Log    Column Name Index : '${ColumnName_Index}'

    ### Verify if Target Column Value can be found on the data column list acquired
    Run Keyword If    ${ColumnName_Index}<0    Fail    '${sColumnName}' is not found at '${DataColumn_List}' Data Column Values.
    ${ColumnName_Index}    Evaluate    ${ColumnName_Index}+1

    [Return]    ${ColumnName_Index}
    
Get Column Header Index
    [Documentation]    This keyword is used to get the Column Header Index of Test_Case and given Column Name at the Excel Sheet.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${bTestCaseColumn}=False    ${sTestCaseColReference}=Test_Case

    Log    (Get Column Header Index) sTestCaseColReference = '${sTestCaseColReference}'

    ${DataColumn_List}    Read Excel Row    1    sheet_name=${sSheetName}
    Log    Data Set Sheet Name: '${sSheetName}'
    Log    Data Set Sheet Column Names: '${DataColumn_List}'

    ### Get Test Case Header Count/Index ###
    ${TestCaseHeaderName_Index}    Get Index From List    ${DataColumn_List}    ${sTestCaseColReference}
    Log    Fetched Test Case Column Index : '${TestCaseHeaderName_Index}'

    ### Set Default Test Case Column Header Index
    ${TestCaseHeaderName_Index}    Run Keyword If    ${TestCaseHeaderName_Index}<0 and '${bTestCaseColumn}'=='False'   Set Variable    2
    ### Set Test Case Column Header Index Based on Actual Index on Excel Data Column Name List
    ...    ELSE    Evaluate    ${TestCaseHeaderName_Index}+1
    Log    Evaluated Test Case Column Index : '${TestCaseHeaderName_Index}'

    ### Get Target Column Value Index ###
    ${ColumnName_Index}    Get Index From List    ${DataColumn_List}    ${sColumnName}
    Log    Column Name Index : '${ColumnName_Index}'

    ### Verify if Target Column Value can be found on the data column list acquired
    Run Keyword If    ${ColumnName_Index}<0    Fail    '${sColumnName}' is not found at '${DataColumn_List}' Data Column Values.
    ${ColumnName_Index}    Evaluate    ${ColumnName_Index}+1

    [Return]    ${TestCaseHeaderName_Index}    ${ColumnName_Index}
    
Get Index of a Row Value using a Reference Header Index
    [Documentation]    This keyword is used to get index of a row value using a reference header index
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sRowValue}    ${sReferenceHeader_Index}

    ### Read Excel Sheet ###
    ${DataRow_List}    Read Excel Column    ${sReferenceHeader_Index}    sheet_name=${sSheetName}
    ${DataRowId_List}    Read Excel Column    1    sheet_name=${sSheetName}
    Log    Row Names Under Reference Header with Index '${sReferenceHeader_Index}' : '${DataRow_List}'

    ### Get Target Row Value Index ###
    ${IsPresentInList}    Run Keyword And Return Status    List Should Contain Value    ${DataRow_List}    ${sRowValue}
    ${IsPresentInList_As_Int}    ${RowValue_Int}    Check if Row Value Exists on List as Int    ${DataRow_List}    ${sRowValue}
    ${DataRowName_Index}    Run Keyword If    ${IsPresentInList}==${True}    Get Index From List    ${DataRow_List}    ${sRowValue}
    ...    ELSE IF    ${IsPresentInList_As_Int}==${True}    Get Index From List    ${DataRow_List}    ${RowValue_Int}
    ...    ELSE    Get Index From List    ${DataRowId_List}    ${sRowValue}
    Log    Row Name Index for '${sRowValue}' : '${DataRowName_Index}'

    ### Verify if Target Row Value can be found on the data row list acquired
    Run Keyword If    ${DataRowName_Index}<0    Fail    '${sRowValue}' is not found at '${DataRow_List}' Data Row Values.
    ${DataRowValue_Index}    Evaluate    ${DataRowName_Index}+1

    [Return]    ${DataRowValue_Index}
    
Check if Row Value Exists on List as Int
    [Documentation]    This keyword is used to check if value exists on a list as a string
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${lTarget_List}    ${sValue}

    ${IsPresentInList}    Set Variable    ${False}

    ### Get Int Conversion Status ###
    ${IsIntConvPassed}    Run Keyword And Return Status    Convert To Integer    ${sValue}

    ### Proceed with Int Conversion and List Check if Conversion Passed. If Conversion Failed, set return value to False
    ${IsPresentInList}    ${RowValue_Int}    Run Keyword If    ${IsIntConvPassed}==${True}    Check if a String Exists as Int on a List    ${lTarget_List}    ${sValue}
    
    [Return]    ${IsPresentInList}    ${RowValue_Int}
    
Check if a String Exists as Int on a List
    [Documentation]    This keyword is used to check if a string exists as an integer on a list.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${lTarget_List}    ${sValue}

    ${Value_Int}    Convert To Integer    ${sValue}
    ${IsPresentInList}    Run Keyword And Return Status    List Should Contain Value    ${lTarget_List}    ${Value_Int}

    [Return]    ${IsPresentInList}    ${Value_Int}
    
    
Read Data From Cell
    [Documentation]    This keyword will be used for reading data from single excel cell.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sSheetName}    ${sColumnName}    ${rowid}    ${bTestCaseColumn}    ${sTestCaseColReference}=None

    Log    (Read Data From Cell) sTestCaseColReference = '${sTestCaseColReference}'

    ${TestCaseHeader_Index}    ${ColumnHeader_Index}    Run Keyword If    '${sTestCaseColReference}'=='None'    Get Column Header Index    ${sSheetName}    ${sColumnName}    ${bTestCaseColumn}
    ...    ELSE    Get Column Header Index    ${sSheetName}    ${sColumnName}    ${bTestCaseColumn}    ${sTestCaseColReference}
    ${RowId_Index}    Get Index of a Row Value using a Reference Header Index    ${sSheetName}    ${rowid}    ${TestCaseHeader_Index}
    ${Cell_Data}    Read Excel Cell    ${RowId_Index}    ${ColumnHeader_Index}    ${sSheetName}

    [Return]    ${Cell_Data}
    

 