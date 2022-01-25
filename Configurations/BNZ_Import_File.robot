*** Settings ***
##Libraries###
Library    HttpLibraryExtended
Library    GenericLib
Library    String
Library    ExcelLibrary
Library    Collections
Library    BuiltIn
Library    Screenshot
Library    RequestsLibrary
Library    JSONLibraryKeywords
Library    OperatingSystem
Library    BaselineComparator
Library    pabot.pabotlib
Library    SeleniumLibraryExtended

###Configurations###
Variables    ../TestSetup/BNZ_Config.py

### Variable Files - Locators ###
Variables    ../ObjectMap/Dashboard_Locators.py
Variables    ../ObjectMap/Payees_Locators.py
Variables    ../ObjectMap/Transfer_Locators.py

### Functional Resource Files ###
Resource    ../ResourceFiles/Functional_Keywords/Process_Keywords/Functional_Resource.robot
Resource    ../ResourceFiles/Functional_Keywords/Source_Keywords/Source_Keywords.robot
Resource    ../ResourceFiles/Functional_Keywords/Source_Keywords/Generic_Keywords.robot

### Integration Resource Files ###
Resource    ../ResourceFiles/Integration_Keywords/Process_Keywords/Integration_Resource.robot
Resource    ../ResourceFiles/Integration_Keywords/Source_Keywords/Source_Keywords.robot
Resource    ../ResourceFiles/Integration_Keywords/Source_Keywords/Generic_Keywords.robot

