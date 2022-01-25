*** Settings ***
Resource   ../../../Configurations/BNZ_Import_File.robot


*** Keywords ***
Create Input Json And Return Json Object
    [Documentation]    This keyword is used to create input json.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${ResponseContent}
    Delete File If Exist    ${Json_Temp}
    ${API_RESPONSE_STRING}    Convert To String    ${ResponseContent}
    Create File    ${Input_Json}    ${API_RESPONSE_STRING}
    ${RESPONSE_FILE}    OperatingSystem.Get File    ${Input_Json}
    Log    ${RESPONSE_FILE}
    ${json_object}    Evaluate        json.loads('''${RESPONSE_FILE}''')    json
    [Return]    ${json_object}
    
Count Number Of Object In Json
    [Documentation]    This keyword is used to count the number of object base on the given key.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sJsonObject}    ${sFieldToGet}
    ${fieldList}    Get Value From Json    ${sJsonObject}    $..${sFieldToGet}
    ${ListCount}    Get Length    ${fieldList}
    Log   Count of Object is: "${ListCount}"
    [Return]    ${ListCount}

Verify Json Response Status Code
    [Documentation]    This keyword is used to verify if response status code is equal to expected response status code.
    ...    @author: jdelacru    - 25JAN22    
    [Arguments]    ${iExpected_ResponseCode}    ${iActual_ResponseCode}
    
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${iExpected_ResponseCode}    ${iActual_ResponseCode}
    ${Resp_Status}    Run Keyword And Return Status    Should Be Equal As Strings    ${iExpected_ResponseCode}    ${iActual_ResponseCode}
    Run Keyword If    ${Resp_Status}==${True}    Log    Expected and Actual Status Codes are matched! ${iExpected_ResponseCode} == ${iActual_ResponseCode}     
    ...    ELSE IF    ${Resp_Status}==${False}    Log    Expected and Actual Status Codes are NOT matched! ${iExpected_ResponseCode} != ${iActual_ResponseCode}    level=ERROR

Validate Actual and Expected Number of Records
    [Documentation]    This keyword is used to compare the number of expected objects vs the actual number of object in api response.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${iExpectedNumOfObjects}    ${iActualCountOfObjects}
    Log    Expected number of records from dataset is ${iExpectedNumOfObjects}
    Log    Actual number of records from json is ${iActualCountOfObjects}
    ${Status}    Run Keyword And Return Status    Should Be Equal As Numbers    ${iExpectedNumOfObjects}    ${iActualCountOfObjects}     
    Run Keyword If    ${Status}==${TRUE}    Log    The number of Expected Records and Actual Records in Response are matched!
    ...    ELSE    Log       The number of Expected Records and Actual Records in Response are not matched!    level=ERROR

Validate If Expected Name Corresponds to the Given ID
    [Documentation]    This keyword is used to compare if the expected ID and Name corresponds to the ID and Name in response.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sJsonObject}    ${iId}    ${sName}
    ${ObjectIdValue}    Get Value From Json    ${sJsonObject}    id
    ${ObjectNameValue}    Get Value From Json    ${sJsonObject}    name
    ${ObjectIdValue_String}    Convert To String    ${ObjectIdValue}
    ${ObjectNameValue_String}    Convert To String    ${ObjectNameValue}
    ${ObjectIdValue_Converted}    Get Substring    ${ObjectIdValue_String}    1    -1
    ${ObjectNameValue_Converted}    Get Substring    ${ObjectNameValue_String}    2    -2
    
    ${IdStatus}    Run Keyword And Return Status    Should Be Equal As Strings    ${ObjectIdValue_Converted}    ${iId}
    ${NameStatus}    Run Keyword And Return Status    Should Be Equal As Strings    ${ObjectNameValue_Converted}    ${sName}
    Run Keyword If    ${IdStatus}==${TRUE} and ${NameStatus}==${TRUE}    Log    Actual Id: ${ObjectIdValue_Converted} and Name:${ObjectNameValue_Converted} Values from JSON corresponds to the Expected ID and Name Value.
    ...    ELSE    Log    Actual Id: ${ObjectIdValue_Converted} and Name:${ObjectNameValue_Converted} Values from JSON does not corresponds to the Expected ID and Name Value.    level=ERROR
    
Update Key Values of Input JSON File for User API
    [Documentation]    This keyword is used to update key values of JSON file and save to new file.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sFilePath}    ${sFileName}    ${iId}    ${sName}    ${sUsername}    ${sEmail}
    ...    ${sAddress}    ${sGeo}    ${iPhone}    ${sWebsite}    ${sCompany}

    ${file_path}    Set Variable    ${temp_input}
    ${EMPTY}    Set Variable
    ${JSON_Object}    Load JSON From File    ${file_path}

    ## add demographic fields here
    ${New_JSON}    Run Keyword If    '${iId}'=='null'    Set To Dictionary    ${JSON_Object}    id=${NONE}
    ...    ELSE IF    '${iId}'==''    Set To Dictionary    ${JSON_Object}    id=${EMPTY}
    ...    ELSE IF    '${iId}'=='Empty' or '${iId}'=='empty'    Set To Dictionary    ${JSON_Object}    id=${EMPTY}
    ...    ELSE IF    '${iId}'=='no tag'    Set Variable    ${JSON_Object}
    ...    ELSE    Set To Dictionary    ${JSON_Object}    id=${iId}    

    ${New_JSON}    Run Keyword If    '${sName}'=='null'    Set To Dictionary    ${JSON_Object}    name=${NONE}
    ...    ELSE IF    '${sName}'==''    Set To Dictionary    ${JSON_Object}    name=${EMPTY}
    ...    ELSE IF    '${sName}'=='Empty' or '${sName}'=='empty'    Set To Dictionary    ${JSON_Object}    name=${EMPTY}
    ...    ELSE IF    '${sName}'=='no tag'    Set Variable    ${JSON_Object}
    ...    ELSE    Set To Dictionary    ${JSON_Object}    name=${sName}

    ${New_JSON}    Run Keyword If    '${sUsername}'=='null'    Set To Dictionary    ${New_JSON}    username=${NONE}
    ...    ELSE IF    '${sUsername}'==''    Set To Dictionary    ${New_JSON}    username=${EMPTY}
    ...    ELSE IF    '${sUsername}'=='Empty' or '${sUsername}'=='empty'    Set To Dictionary    ${New_JSON}    username=${EMPTY}
    ...    ELSE IF    '${sUsername}'=='no tag'    Set Variable    ${New_JSON}
    ...    ELSE    Set To Dictionary    ${New_JSON}    username=${sUsername}

    ${New_JSON}    Run Keyword If    '${sEmail}'=='null'    Set To Dictionary    ${New_JSON}    email=${NONE}
    ...    ELSE IF    '${sEmail}'==''    Set To Dictionary    ${New_JSON}    email=${EMPTY}
    ...    ELSE IF    '${sEmail}'=='Empty' or '${sEmail}'=='empty'    Set To Dictionary    ${New_JSON}    email=${EMPTY}
    ...    ELSE IF    '${sEmail}'=='no tag'    Set Variable    ${New_JSON}
    ...    ELSE    Set To Dictionary    ${New_JSON}    email=${sEmail}
    
    ${New_JSON}    Run Keyword If    '${iPhone}'=='null'    Set To Dictionary    ${New_JSON}    phone=${NONE}
    ...    ELSE IF    '${iPhone}'==''    Set To Dictionary    ${New_JSON}    phone=${EMPTY}
    ...    ELSE IF    '${iPhone}'=='Empty' or '${iPhone}'=='empty'    Set To Dictionary    ${New_JSON}    phone=${EMPTY}
    ...    ELSE IF    '${iPhone}'=='no tag'    Set Variable    ${New_JSON}
    ...    ELSE    Set To Dictionary    ${New_JSON}    phone=${iPhone}
    
    ${New_JSON}    Run Keyword If    '${sWebsite}'=='null'    Set To Dictionary    ${New_JSON}    website=${NONE}
    ...    ELSE IF    '${sWebsite}'==''    Set To Dictionary    ${New_JSON}    website=${EMPTY}
    ...    ELSE IF    '${sWebsite}'=='Empty' or '${sWebsite}'=='empty'    Set To Dictionary    ${New_JSON}    website=${EMPTY}
    ...    ELSE IF    '${sWebsite}'=='no tag'    Set Variable    ${New_JSON}
    ...    ELSE    Set To Dictionary    ${New_JSON}    website=${sWebsite}
     
    ${address}    Split String    ${sAddress}    ,
    ${geo}    Split String    ${sGeo}    ,
    ${company}    Split String    ${sCompany}    ,
    
    ${defaultBusinessEntity_sublist}    Set Variable    street,suite,city,zipcode
    ${geo_sublist}    Set Variable    lat,lng
    ${company_sublist}    Set Variable    name,catchPhrase,bs    
    
    ${addressDict}    Create Dictionary for Single Set of Multiple Different Sub-Keyfields    ${address}    0    ${defaultBusinessEntity_sublist}
    ${geoDict}    Create Dictionary for Single Set of Multiple Different Sub-Keyfields    ${geo}    0    ${geo_sublist}

    ${addressDict}    Set To Dictionary    ${addressDict}    geo=${geoDict}
    ${compDict}    Create Dictionary for Single Set of Multiple Different Sub-Keyfields    ${company}    0    ${company_sublist}
    
    ${New_JSON}    Set To Dictionary    ${New_JSON}    address=${addressDict}            
    ${New_JSON}    Set To Dictionary    ${New_JSON}    company=${compDict}
    Log    ${New_JSON}
    
    ${Converted_JSON}    Evaluate    json.dumps(${New_JSON})        json
    Log    ${Converted_JSON}
    ${JSON_File}    Set Variable    ${Input_Json}
    Delete File If Exist    ${JSON_File}
    Create File    ${JSON_File}    ${Converted_JSON}
    ${NewFile}    OperatingSystem.Get File    ${JSON_File}
    
    [Return]    ${NewFile}
    
Validate Response Data
    [Documentation]    This keyword will verify if the given text is present in API response.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sApi_Response}    ${sTextToValidate}
    Log    API Response is ${sApi_Response}
    Log    Text to Validate is ${sTextToValidate}
    ${converted_response}    Convert To String    ${sApi_Response}
    ${Status}    Run Keyword And Return Status    Should Contain    ${converted_response}    ${sTextToValidate}
    Run Keyword If    ${Status}==${TRUE}    Log    Given user record is present in API Response.
    ...    ELSE     Log     Given user record is present in API Response. level=ERROR
    
Create Dictionary for Single Set of Multiple Different Sub-Keyfields
    [Documentation]    This keyword is used to create dictionary for multiple different sub-keyfields.
    ...    i.e. "defaultBusinessEntity": {"defaultBranch": "value2", "businessEntityName": "value1"}
    ...    @author: jdelacru	- 25JAN22
    [Arguments]    ${datalist}    ${INDEX_0}    ${subkeyfield_list}
    ${value_from_list}    Get From List    ${datalist}    ${INDEX_0}
    ${multipleval}    Run Keyword And Return Status    Should Contain    ${value_from_list}    |

    ${subfield_val}    Run Keyword If    ${multipleval}==True    Split String    ${value_from_list}    |
    ...    ELSE    Set Variable    ${value_from_list}

    ${keyfield_count}    Run Keyword If    ${multipleval}==True    Get Length    ${subfield_val}
    ...    ELSE    Set Variable    1
    ${INDEX_00}    Set Variable    0
    ${tempdict}    Create Dictionary
    ${subkeyfieldlist}    Split String    ${subkeyfield_list}    ,
    FOR    ${INDEX_00}    IN RANGE    ${keyfield_count}
        Exit For Loop If    ${INDEX_00}==${keyfield_count}
        ${subkeyfield}    Get From List    ${subkeyfieldlist}    ${INDEX_00}
        ${subkeyfield_0}    Run Keyword If    ${keyfield_count}==1    Get From List    ${subkeyfieldlist}    0
        ${subkeyfield_1}    Run Keyword If    ${keyfield_count}==1    Get From List    ${subkeyfieldlist}    1
        ${subkeyfield_0_exist}    Run Keyword And Return Status    Should Contain    ${subfield_val}    ${subkeyfield_0}
        ${subkeyfield_1_exist}    Run Keyword And Return Status    Should Contain    ${subfield_val}    ${subkeyfield_1}
        ${subfield_val_0}    Run Keyword If    ${keyfield_count}==2    Get From List    ${subfield_val}    0
        ${subkeyfield_val}    Run Keyword If    ${keyfield_count}==1    Set Variable    ${subfield_val}
         ...    ELSE    Get From List    ${subfield_val}    ${INDEX_00}
        ${emptyval}    Run Keyword If    ${keyfield_count}==1 and ${subkeyfield_0_exist}==True    Set Variable    ${subkeyfield_0}=""
         ...    ELSE IF    ${keyfield_count}==1 and ${subkeyfield_1_exist}==True    Set Variable    ${subkeyfield_1}=""
         ...    ELSE    Set Variable    ${subkeyfield}=""
        ${nullval}    Set Variable    ${subkeyfield}=null
        Run Keyword If    ${keyfield_count}==2 and '${subkeyfield_val}'=='${emptyval}'    Set To Dictionary    ${tempdict}    ${subkeyfield}=${EMPTY}
         ...    ELSE IF    ${keyfield_count}==2 and '${subkeyfield_val}'=='${nullval}'    Set To Dictionary    ${tempdict}    ${subkeyfield}=${NONE}
         ...    ELSE IF    ${keyfield_count}==1 and '${subkeyfield_val}'=='${emptyval}' and ${subkeyfield_0_exist}==True    Set To Dictionary    ${tempdict}    ${subkeyfield_0}=${EMPTY}
         ...    ELSE IF    ${keyfield_count}==1 and '${subkeyfield_val}'=='${nullval}' and ${subkeyfield_0_exist}==True    Set To Dictionary    ${tempdict}    ${subkeyfield_0}=${NONE}
         ...    ELSE IF    ${keyfield_count}==1 and '${subkeyfield_val}'=='${emptyval}' and ${subkeyfield_1_exist}==True    Set To Dictionary    ${tempdict}    ${subkeyfield_1}=${EMPTY}
         ...    ELSE IF    ${keyfield_count}==1 and '${subkeyfield_val}'=='${nullval}' and ${subkeyfield_1_exist}==True    Set To Dictionary    ${tempdict}    ${subkeyfield_1}=${NONE}
         ...    ELSE    Set To Dictionary    ${tempdict}    ${subkeyfield}=${subkeyfield_val}
    END
    ${tempdict}    Run Keyword If    '${subkeyfield_val}'==''    Set Variable    ${EMPTY}
    ...    ELSE IF    '${subkeyfield_val}'=='null'    Set Variable    ${NONE}
    ...    ELSE IF    '${subkeyfield_val}'=='no tag'    Create List
    ...    ELSE    Set Variable    ${tempdict}
    [Return]    ${tempdict}

