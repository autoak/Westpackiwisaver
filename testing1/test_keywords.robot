*** Settings ***
Documentation     Kiwisaver portal for westpac keywords
Resource          ../helper.robot
Library           ../util.py
Library           ../config.py
Variables          test_sitedata.py



*** Keywords ***
User go to the kiwisaver scheme retirement calculator
    Go To Url And Wait For Element     ${TEST_URL}${kiwi_saver_cal}     ${get_started_button}

User clicks the get started button
    Click Element And Wait For Another Element      ${get_started_button}    ${kiwi_save_retirement_cal}

User verifies the information icons
   Select frame      ${kiwi_saver_iframe}
   Verify page contain element:        ${kiwi_saver_current_age}
   Verify page contain element:        ${kiwi_saver_employment_status}
   Verify page contain element:        ${kiwi_saver_current_balance}
   Verify page contain element:        ${kiwi_saver_vol_contribution}
   Verify page contain element:        ${kiwi_saver_Risk_Profile}
   Verify page contain element:        ${kiwi_saver_Savings_Goal}
   Unselect frame

User clicks information icon besides Current age the message
   Sleep     2s
   Select frame      ${kiwi_saver_iframe}
   Click Element And Wait For Another Element       ${kiwi_saver_current_age}      ${kiwi_saver_age_calculator_msg}
   Verify page element text:      ${kiwi_saver_age_calculator_msg}      This calculator has an age limit of 18 to 64 years old
   Unselect frame

User enters the current age as ${value}
    Select frame      ${kiwi_saver_iframe}
    Input Text      ${current_age_input}   ${value}
    Unselect frame
    Sleep   2s

User is ${status}
    Select frame      ${kiwi_saver_iframe}
    Click Element     ${employment_status_input}
    Run Keyword If   '${status}' == 'employed'       Click Element      ${employment_status_employed}
    ...      ELSE IF    '${Status}' == 'self-employed'      Click Element      ${employment_status_self_employed}
    ...      ELSE      Click Element      ${employment_status_not_employed}
    Unselect frame
    Sleep    2s

User has salary ${amount} p/a
    Select frame      ${kiwi_saver_iframe}
    Input Text        ${salary_wage_per_year_input}     ${amount}
    Unselect frame
    Sleep    2s

User contribution for kiwisaver is ${percentage}
    Select frame      ${kiwi_saver_iframe}
    Click Element        ${kiwi_saver_member_contibution}
    Unselect frame
    Sleep    2s

User selects risk profile as ${risk_profile}
    Select frame      ${kiwi_saver_iframe}
    Run Keyword If   '${risk_profile}' == 'defensive'       Click Element     ${risk_profile_defensive}
    ...        ELSE IF  '${risk_profile}' == 'conservative'        Click Element     ${risk_profile_conservative}
    ...        ELSE       Click Element     ${risk_profile_balanced}
    Unselect frame

User clicks the retirement projection button
   Select frame      ${kiwi_saver_iframe}
   Wait Until Element Is Visible        ${retierment_projection_button}
   Click Element     ${retierment_projection_button}
   Unselect frame

User has current kiwisaver balance as $${total_balance}
   Select frame      ${kiwi_saver_iframe}
   Input Text        ${kiwi_saver_balance_input}     ${total_balance}
   Unselect frame

User has voluntary contributes of $${contribution} per ${frequency}
   Select frame      ${kiwi_saver_iframe}
   Input Text        ${voluntary_contribution}       ${contribution}
   Click Element     ${frequecy_for_contibution}
   Run Keyword If   '${frequency}' == 'fortnightly'       Click Element     ${frequecy_for_fortnightly}
   ...         ELSE        Click Element     ${frequecy_for_annually}
   Unselect frame

User has a saving goal of $${saving_amount}
  Select frame      ${kiwi_saver_iframe}
  Input Text        ${Saving_goal_at_retirement}       ${saving_amount}
  Unselect frame

