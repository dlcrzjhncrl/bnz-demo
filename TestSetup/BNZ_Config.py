###Dataset###
import os
dataset_path = os.path.dirname(os.path.dirname(__file__))
Functional_DatasetPath = dataset_path + "\\DataSet\\Functional_DataSet\\Functional_DataSet.xlsx"
Integration_DatasetPath = dataset_path + "\\DataSet\\Integration_DataSet\\Integration_DataSet.xlsx"
RowId = '1'

###BNZ###
BNZ_URL = "https://www.demo.bnz.co.nz/client/"
BROWSER = "firefox"
RETRY = '20'
RETRY_INTERVAL = '1s'

###API###
APISESSION = 'APISESSION'
RESPONSECODE_200 = '200'
RESPONSECODE_201 = '201'
URI = 'https://jsonplaceholder.typicode.com'

###API Template Files###
Input_Json = dataset_path + '\\DataSet\\Integration_DataSet\\inputJson.json'
Json_Temp = dataset_path + '\\DataSet\\Integration_DataSet\\jsonTemp.json'
temp_input = dataset_path + '\\DataSet\\Integration_DataSet\\templateinput.json'

