*** Settings ***
Resource   ../../../Configurations/BNZ_Import_File.robot


*** Keywords ***
Verify Get Request And Number Of Records
    [Documentation]    This keyword will send get request and verify the number of record in response vs the expected number of records.
    ...    @author: jdelacru    25JAN22
    [Arguments]    ${DatasetPath}    
    ${ResponseCode}    ${ResponseContent}    Send Get Request
    Verify JSON Response Status Code    ${RESPONSECODE_200}    ${ResponseCode}
    ${JsonObject}    Create Input Json And Return Json Object    ${ResponseContent}
    ${Count}    Count Number Of Object In Json    ${JsonObject}    ${DatasetPath}[ObjectToValidate]
    Validate Actual and Expected Number of Records    ${DatasetPath}[ExpectNumberOfObjects]    ${Count}
    
Verify Get Request By Id
    [Documentation]    This Keyword will validate if the given id corresponds to the expected name from request response base on dataset.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${DatasetPath}
    ${ResponseCode}    ${ResponseContent}    Send Get Request    ${DatasetPath}[ObjectId]
    Verify JSON Response Status Code    ${RESPONSECODE_200}    ${ResponseCode}
    ${JsonObject}    Create Input Json And Return Json Object    ${ResponseContent}
    Validate If Expected Name Corresponds to the Given ID    ${JsonObject}    ${DatasetPath}[ObjectId]    ${DatasetPath}[ExpectedNameResult]
    
Verify User Post
    [Documentation]    This keyword will post a user details and validate if the record is in request reponse.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${DatasetPath}
    ${New_JSON_File}    Update Key Values of Input JSON File for User API    ${DatasetPath}[InputFilePath]    ${DatasetPath}[InputJson]       ${DatasetPath}[id]     
    ...    ${DatasetPath}[name]    ${DatasetPath}[username]    ${DatasetPath}[email]    ${DatasetPath}[address] 
    ...    ${DatasetPath}[geo]    ${DatasetPath}[phone]    ${DatasetPath}[website]    ${DatasetPath}[company]
    ${RespnseStatusCode}    ${ResponseContent}    Send Post Request    ${New_JSON_File}
    Validate Response Data    ${ResponseContent}    ${DatasetPath}[username]
    
    

