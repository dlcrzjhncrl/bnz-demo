###BNZ Dashboard###
Dashboard_Menu_Button = '//div[@class="topbar-actions messages"]//button[contains (@class,"MenuButton")]'
Dashboard_Bnz_Icon = '//div[@class="MainMenu-bnzIcon"]'
Dashboard_Menu_Left_Panel = '//nav[@class="MainMenu-nav"]'
Dashboard_Payees_Menu_Button = '//nav[@class="MainMenu-nav"]//span[text()="Payees"]'
Dashboard_PayTransfer_Menu_Button = '//nav[@class="MainMenu-nav"]//span[text()="Pay or transfer"]'
Dashboard_Sender_Profile_Icon = '//span[@class="AccountsGrid-printAccount"]//h3[contains(@title,"${sSender}")]'
Dashboard_Receiver_Profile_Icon = '//span[@class="AccountsGrid-printAccount"]//h3[contains(@title,"${sReceiver}")]'
Dashboard_Loaded = '//div[@class="hints"]'
Dashboard_BNZ_Logo = '//div[@class="MainMenu-bnzIcon"]//img[@src="/client/images/41d4b65315e2f333c2b914c5f0fad572.svg"]'
AccountDetails_CurrentBalance_Text = '//h4[contains (@class,"account-current")]'
AccountDetails_Close_Button = '//span[@aria-label="Close account details"]'






























#### MDM Interface Related Locators #####
Get_File = 'Get_Data1.json'
Post_File_Calendar = 'Post_Data.json'
Post_PastYear = 'Post_Past Yr,Date comparision.json'
Resp_Post_PastYr = 'Resp_Post_Past Year.json'
Post_Invalid_LOB = 'Post_Invalid LOBs.json'
Resp_Post_Invalid_LOB = 'Resp-Post_Invalid LOBs.json'
Put_File = 'Put_Data.json'
Put_PastYear = 'Put_Past Yr,Date comparision.json'
Resp_Put_PastYr = 'Resp_Put_Past Year.json'
Put_Invalid_LOB = 'Put_Invalid LOBs.json'
Resp_Put_Invalid_LOB = 'Resp-Put_Invalid LOBs.json'

FFC_UI_Login_File = 'FFC_Data.xlsx'

# DB_API_Module  =  'cx_Oracle'
# DBServiceName = 'FBC'
# DBUsername = 'system'
# DBPassword = 'Oracle123'
# DBHost = 'BLR2QALP0151'
# DBPort = '1521'
# DB_URL = 'jdbc:oracle:thin:system@//BLR2QALP0151:1521/FBC'


Parent_Entry    =   'xpath=//div[@id="gwt-uid-33"]/div[2]/div[1]/table/tbody/tr[1]/td[1]/div/span'
Child_Entry =   'xpath=//div[@id="gwt-uid-33"]/div[2]/div[1]/table/tbody/tr[2]/td[3]'
Timestamp   =   'xpath=//div[@id="gwt-uid-27"]/div[1]/div[1]/div/table/tbody/tr/td[1]/div[3]'
#Table_Entry =   'xpath=//div[@id="gwt-uid-27"]/div[3]/div[1]/table/tbody/tr[1]/td[2]/div'
#Table_Entry =   'xpath=//*[@id="gwt-uid-27"]/div[3]/div[1]/table/tbody/tr/td[2]'
Table_Entry =   'xpath=//*[@id="gwt-uid-27"]/div[3]/div[1]/table/tbody/tr/td[4]'
Scrollbar   =   'xpath=//div[@id="mchui-103716774"]/div/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div[2]'
Textarea    =   'xpath=//textarea[@class="v-textarea v-widget v-has-width v-has-height"]'
Textarea_ReadOnly    =   'xpath=//textarea[@class="v-textarea v-widget v-has-width v-has-height v-readonly v-textarea-readonly"]'
Message     =   'xpath=//div[@id="gwt-uid-34"]/div'
admin_dropdown = 'xpath=//span[@class="v-menubar-menuitem v-menubar-menuitem-settings-menu"]'

textjms =   'xpath=//span[text()="TextJMS"]' 
# TextJMS_Parent  =   'xpath=//div[@location="sumTable"]//tr[2]//div[text()="TextJMS"]/span'
TextJMS_Parent = 'xpath=//div[@location="sumTable"]//tr//div[contains(text(),"TextJMS")]'
TextJMS_Child   =   'xpath=//span[@class="v-treetable-treespacer"]' 
Table_Entry1   =  'xpath=//div[@id="gwt-uid-27"]/div[3]/div[1]/table/tbody/tr[6]/td[1]/div'
Table_Entry2   =  'xpath=//div[@id="gwt-uid-27"]/div[3]/div[1]/table/tbody/tr[1]/td[1]/div'

##Summary table
Processing_col = '//div[contains(@class,"processing")]//span//span'
Successful_col = '//div[contains(@class,"success")]//span//span'
Warning_col = '//div[contains(@class,"warning")]//span//span'
Error_col = '//div[contains(@class,"error")]//span//span'
Failed_col = '//div[contains(@class,"failed")]//span//span'
Sent_col = '//div[contains(@class,"sent")]//span//span'
Discarded_col = '//div[contains(@class,"discarded")]//span//span'
Split_col = '//div[contains(@class,"split")]//span//span'
Batched_col = '//div[contains(@class,"batched")]//span//span'



#BASE INTEREST RATES
BaseRates_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="BaseinterestratesApiSource"]'
BaseRatesRow_Child_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row-odd")]//div[text()="BaseinterestratesApiSource"]'

#FX Rates
FXRates_Row_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="FxratesApiSource"]'
FXRates_Row_Child_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row-odd")]//div[text()="FxratesApiSource"]'

#FFC TEXTJMS FFC UI
textjms =   'xpath=//span[text()="TextJMS"]' 
TextJMS_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class, "v-table-row")]//div[text()="TextJMS"]'
TextJMS_Child_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row-odd")]//div[text()="TextJMS"]'
TextJMS_CategoryName_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[15]'
TextJMS_ResultFirstRow_Table = 'xpath=//div[@location="resultsTable"]//div[contains(@class,"v-table-body")]//tr[1]'
TextJMS_Status_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[3]'
Textarea_config_error    =   'xpath=//textarea[@class="v-textarea v-widget v-has-width v-has-height v-readonly v-textarea-readonly"]'


TextJMS_QName_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[7]'
TextJMS_ShowHistory='//*[@id="PID_VAADIN_CM"]/div/div/table/tbody/tr[2]'
History_Timestamp = '//*[@id="mchui-103716774-window-overlays"]//div[@location="resultsTable"]//div[@class="v-table-header"]//div[text()="TIMESTAMP"]'
TextJMS_Operation_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[24]'
History_Status_TextField = '//*[@id="mchui-103716774-window-overlays"]//div[@location="resultsTable"]//div[@class="filters-panel"]//input[2]'
History_Table_Entry = '//*[@id="mchui-103716774-window-overlays"]//div[@location="resultsTable"]//div[3]/div[1]/table/tbody/tr[1]/td[1]/div'
History_Textarea= '//*[@id="mchui-103716774-window-overlays"]//div[@location="messageTable"]//div[@class="v-scrollable"]//textarea'
Dialog_Close = '//*[@id="mchui-103716774-window-overlays"]//div[@class="v-window-closebox"]'

SSO_Username_Locator    =   'xpath=//input[@id="username"]'
SSO_Password_Locator    =   'xpath=//input[@id="password"]'
SigninSSO  =   'xpath=//input[@id="login"]'
SSO_Search_locator  =   'xpath=//input[@id="uxpMenuSearch"]'
SSO_ENQUIRE_UserID_locator  =   'xpath=//input[@name="03userDetail:UserID"]'
SSO_Search_Button   =   'xpath=//input[@name="Search"]'

SSO_ENQUIRE_Radio_UserID_locator  ='xpath=//div[@name="Usersd7a53c5f00kg1fff%56_rowSelector"]'
    
SSO_User_Table ='xpath=//table[@class="dojoxGridRowTable"]/tbody/tr/td[2]'
Cancel_Search_User = 'xpath=//span[@class="dijitDialogCloseIcon"]'

menu_logout=    'xpath=//span[@id="uxpHelpMenu"]'
SSO_Logout  =   'xpath=//table[@id="uxpUserHelpList"]/tbody/tr[@id="logoutButton"]'
#### End of MDM Interface Related Locators #####

#CALENDAR
Calendar_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="CalendarsApiSource"]'
CalendarRow_Child_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row-odd")]//div[text()="CalendarsApiSource"]'

#USERS/SSO
Users_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="UsersApiSource"]'
UsersRow_Child_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[contains(text(),"API")]'
TextJMS_Operation_TextField_User = 'xpath=//div[contains(@id,"gwt-uid-27")]//div[@class="filters-wrap"]//input[18]'
OpenAPI_Operation_TextField_User = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[25]'
TextJM_Filter_TextField = 'xpath=//div[contains(@id,"gwt-uid-27")]//div[@class="filters-wrap"]//input'
TextJMS_Operation_TextField_User_Fail = 'xpath=//div[contains(@id,"gwt-uid-27")]//div[@class="filters-wrap"]//input[26]'
TextJMS_Operation_TextField_forDel = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[23]'
TextJMS_Operation_TextFieldUser_SingleFailed = 'xpath=//div[contains(@id,"gwt-uid-27")]//div[@class="filters-wrap"]//input[24]'
TextJMS_Operation_TextFieldUser_Failed = 'xpath=//div[contains(@id,"gwt-uid-27")]//div[@class="filters-wrap"]//input[18]'

## CORRESPONDENCE
Corres_CBACorresUpdateMQ_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="CBACorrespUpdateMQ"]'
Corres_CBACorresUpdateMQ_Child_Entry = 'xpath=(//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="CBACorrespUpdateMQ"])[2]' 
Corres_CBACorresUpdateMQ_Result_Headers_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[15]'

Corres_FFC1CMUpdateSourceMQ_Parent_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="FFC1CMUpdateSourceMQ"]'
Corres_FFC1CMUpdateSourceMQ_Child_Entry = 'xpath=(//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="FFC1CMUpdateSourceMQ"]/ancestor::tr//descendant::td/div[text()="UNKNOWN"])[2]'
Corres_FFC1CMUpdateSourceMQ_Failure_Child_Entry = 'xpath=//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="FFC1CMUpdateSourceMQ"]/ancestor::tr//descendant::td/div[text()="liqUpdateFailure"]'
Corres_FFC1CMUpdateSourceMQ_Result_CorelationId_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[15]'
Corres_FFC1CMUpdateSourceMQ_Result_Failed_CorelationId_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[18]'
Corres_FFC1CMUpdateSourceMQ_Result_NoticeId_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[16]'
Corres_FFC1CMUpdateSourceMQ_Result_Payload_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[17]'
Corres_Status_TextField = 'xpath=//div[@location="resultsTable"]//div[@class="filters-panel"]//input[3]'
Corres_Failed_Row_DivText = 'xpath=//*[@id="gwt-uid-27"]/div[3]/div[1]/table/tbody/tr/td[17]/div'

###Refactor Locators###

###Login Page###
FFC_Username_Locator    =   'xpath=//input[@id="gwt-uid-5"]'
FFC_Password_Locator    =   'xpath=//input[@id="gwt-uid-3"]'
Signin  =   'xpath=//div[@id="loginContent"]/div[2]/div[3]/div'

###START###
###FFC Header###
Admin   =   'xpath=//span[text()="admin"]'
Logout  =   'xpath=//span[text()="Log out"]'

###Dashboar###
FFC_Dashboard   =   'xpath=//span[text()="Dashboard"]'
Refresh_Button = 'xpath=//span[@class="v-nativebutton-caption"]'

###Dashboard - Summary Table###
Summary_Table = '//div[@location="sumTable"]'
Summary_Column = '//div[@location="sumTable"]//div[@class="v-table-header-wrap"]//div[contains(@class,"caption-container")]'
Summary_Header = '//div[@location="sumTable"]//div[@class="v-table-header-wrap"]//td'
Summary_Header_Text = '//div[contains(@class,"caption-container")]'
Summary_Row = '//div[@location="sumTable"]//div[contains(@class,"v-table-body")]//tr[contains(@class,"v-table-row")]'
PerColumnValue = '//td'
TextValue = '//div'
Processing_Column = '//div[contains(@class,"processing")]//span//span'
Successful_Column = '//div[contains(@class,"success")]//span//span'
Warning_Column = '//div[contains(@class,"warning")]//span//span'
Error_Column = '//div[contains(@class,"error")]//span[@class="dashboard-caption"]'
Failed_Column = '//div[contains(@class,"failed")]//span//span'
Sent_Column = '//div[contains(@class,"sent")]//span//span'
Discarded_Column = '//div[contains(@class,"discarded")]//span//span'
Split_Column = '//div[contains(@class,"split")]//span//span'
Batched_Column = '//div[contains(@class,"batched")]//span//span'
OpenAPI_Source_Parent_Row = '//div[@location="sumTable"]//tr[contains(@class,"v-table-row")]//div[text()="${sSourceName}"]'
OpenAPI_Source_Child_Row = '//div[@location="sumTable"]//tr[contains(@class,"v-table-row") and contains(@class,"odd")]//div[text()="${sSourceName}"]'
OpenAPI_Source_SecondChild_Row = '//div[@location="sumTable"]//tr[@class="v-table-row"]//div[text()="${sSourceName}"]'
OpenAPI_Source_Child_Row_Instance = '//div[@location="sumTable"]//tr[contains(@class,"v-table-row-odd")]//div[text()="${sSourceName}"]//../following::div[text()="${sInstance}"]'
OpenAPI_Source_Child_Row_Success_Instance = '//div[@location="sumTable"]//tr[contains(@class,"v-table-row-odd")]//div[text()="${sSourceName}"]//../following::div[text()="${sOutputType}"]'

###Dashboard - Results table###
Results_Header = '//div[@location="resultsTable"]//div[contains(@class,"v-table-header-wrap")]//td'
Results_Header_Text = '//div[contains(@class,"caption-container")]'
Results_Row = '//div[@location="resultsTable"]//tr[contains(@class,"v-table-row")]'
Results_Table_Caption = '//div[@location="resultsTable"]//div[@class="v-captiontext" and contains(text(), "ALL messages matching")]'
Results_FilterPanel = '//div[@location="resultsTable"]//div[@class="filters-panel"]//input[@type="text"]'

###Dashboard - Message###
Message_Selected_Header = '//div[contains(@class,"captiontext")][starts-with(text(),"SELECTED")]'
Textarea = '//textarea[contains(@class,"v-textarea")]'

###Loading Indicator###
Loading_Indicator = '//div[contains(@class,"loading-indicator")][contains(@style,"display: block")]'