*** Settings ***
Documentation
...               These are helper functions or wrapper keywords that simplifies the operation
...               of the application under test.
Library           SeleniumLibrary    60
Library           String
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           util.py
Variables         config.py

*** Variables ***
${AWS_CODE_BUID_ID}    %{CODEBUILD_BUILD_ID}    #AWS codebuild job has a environmental variable $CODEBUILD_BUILD_ID

*** Keywords ***
Open browser and maximize
    Close all browsers
    Wait Until Keyword Succeeds    120 s    10 s    Open browser and check
    Wait For Page To Load
    Cancel chrome browser upgrade popup
    Maximize Browser Window

Go To Url And Wait For Element
    [Arguments]    ${url}    ${element}
    Go To    ${url}
    Execute Javascript    document.documentElement.scrollTop=0    #scroll to top of the page
    Wait Until Keyword Succeeds    ${timeout}    ${polltime}    Wait Until Element Is Visible    ${element}

Cancel chrome browser upgrade popup
    wait until keyword succeeds  4x  2s  Click Element If It Exists     css=#buorgig

Open browser and check
    Open new browser
    Location Should Contain    ${TEST_URL}

Open new browser
    [Timeout]    120s
    Log     command_executor=${command_executor}
    Run Keyword If      '${command_executor}' == 'None'     Open Browser    ${TEST_URL}    browser=${browser}
    Run Keyword Unless  '${command_executor}' == 'None'     Open Browser    ${TEST_URL}    browser=${browser}     remote_url=${command_executor}    desired_capabilities=${desired_capabilities}

Wait For Page To Load
    Wait For Condition    return window.document.readyState == "complete"
    ${pagetitle}    Get Title

Click Element If It Exists
    [Arguments]    ${locator}
    ${status}    Run Keyword And Return Status    Element Should Be Visible    ${locator}    loglevel=NONE
    Run Keyword If    '${status}' == 'True'    Click Element    ${locator}

Click Element And Wait For Another Element
    [Arguments]    ${element1}    ${element2}
	Set Selenium Timeout    240
    Wait Until Keyword Succeeds    ${timeout}    ${polltime}    Wait Until Element Is Visible    ${element1}
    Click Element    ${element1}
    Wait Until Keyword Succeeds    ${timeout}    ${polltime}    Wait Until Element Is Visible    ${element2}

Create Global Variable For Overall Test Result
    Set Global Variable    ${GLOBAL_TEST_STATUS}    "success"    # the global variable indicates the overall test result(success/failure) of all test suites

Update Global Test Status
    ${var_existing}=    Run keyword and return status    Variable Should Exist    ${GLOBAL_TEST_STATUS}
    Run keyword unless    ${var_existing}    Create Global Variable For Overall Test Result    # this keyword should be only called for 1st test suite while the varaible is not created
    ${curr_global_test_status}=    Set Variable    ${GLOBAL_TEST_STATUS}

    ${GLOBAL_TEST_STATUS}=    Set Variable If
    ...    '${SUITE STATUS}'=='FAIL'    "failure"    #  ${SUITE STATUS} is an automatic variable indicates the status of the current test suit
    ...    '${SUITE STATUS}'=='PASS'    ${curr_global_test_status}
    Set Global Variable    ${GLOBAL_TEST_STATUS}

Click Element And Wait Page Contains Text
    [Arguments]    ${element}    ${text}
	Set Selenium Timeout    30
    Wait Until Keyword Succeeds    ${timeout}    ${polltime}    Wait Until Element Is Visible    ${element}
    Click Element    ${element}
    Wait Until Page Contains    ${text}    ${timeout}

Get Element Text If It Exists
    [Arguments]    ${locator}
    ${status}    Run Keyword And Return Status    Page Should Contain Element    ${locator}    loglevel=NONE
    ${element_text}    Run Keyword If    '${status}' == 'True'    Get Text    ${locator}
    [Return]    ${element_text}

Verify page contain element:
   [Arguments]    ${element_name}
   Page should contain element    ${element_name}

Verify page element:
    [Arguments]    ${element_name}
    Element Should Be Visible    ${element_name}

Verify page element text:
    [Arguments]    ${element_name}    ${element_text}
    ${element_text_actual}    Get Text    ${element_name}
    Should Contain    ${element_text_actual}    ${element_text}    [ERROR] Text value for element ${element_name} is "${element_text_actual}" - SHOULD BE "${element_text}"

Element Text Should Not Be Empty
    [Arguments]     ${element}
    ${element_text}     Get Element Text If It Exists   ${element}
    Should Not Be Empty     ${element_text}