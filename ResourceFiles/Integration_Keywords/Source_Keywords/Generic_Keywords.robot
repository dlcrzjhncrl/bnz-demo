*** Settings ***
Resource    ../../../Configurations/BNZ_Import_File.robot

*** Keywords ***
Send Get Request
    [Documentation]    This keyword is used to Send Get Request.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${id}=${EMPTY}
    Create Session    ${APISESSION}    ${URI}    disable_warnings=1
    ${API_RESPONSE}    Get Request    ${APISESSION}    users/${id}
    Log    API Status Code is ${API_RESPONSE.status_code}    
    Log    API Response Content is ${API_RESPONSE.content}   
    [Return]    ${API_RESPONSE.status_code}    ${API_RESPONSE.content}
    
 Send Post Request
    [Documentation]    This keyword will send post request with the given input json file.
    ...    @author: jdelacru    - 25JAN22
    [Arguments]    ${sJsonFile}
    ###Send Input JSON POST###
    ${headers}    Create Dictionary    Content-Type=application/json
    Create Session    ${APISESSION}    ${URI}    disable_warnings=1
    ${API_RESPONSE}    Post Request    ${APISESSION}    users    ${sJsonFile}    headers=${headers}
    Log    API Status Code is ${API_RESPONSE.status_code}    
    Log    API Response Content is ${API_RESPONSE.content}  
    [Return]    ${API_RESPONSE.status_code}    ${API_RESPONSE.content}
