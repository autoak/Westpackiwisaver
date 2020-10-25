*** Settings ***
Documentation       Kiwisaver portal for westpac test cases
Test Setup          Open browser and maximize
Test Teardown       run keywords
...                 Close Browser
Suite Teardown      Update Global Test Status
Resource           test_keywords.robot

*** Test Cases ***
TC_KS_001_Verify the kiwi saver portal
   [tags]  codebuild_ready     TC_kiwi_saver_001
   Given User go to the kiwisaver scheme retirement calculator
   When User clicks the get started button
   Then User verifies the information icons
   And User clicks information icon besides Current age the message


TC_KS_002_kiwi saver retirement calculator for user who has age as 30
   [tags]   codebuild_ready    TC_kiwi_saver_002
   Given User go to the kiwisaver scheme retirement calculator
   When User clicks the get started button
   And User enters the current age as 30
   And User is employed
   And User has salary 82000 p/a
   And User contribution for kiwisaver is 4%
   And User selects risk profile as defensive
   Then User clicks the retirement projection button


TC_KS_003_kiwi saver retirement calculator for user who has age as 45
   [tags]   codebuild_ready    TC_kiwi_saver_003
   Given User go to the kiwisaver scheme retirement calculator
   When User clicks the get started button
   And User enters the current age as 45
   And User is self-employed
   And User has current kiwisaver balance as $100000
   And User has voluntary contributes of $090 per fortnightly
   And User selects risk profile as conservative
   And User has a saving goal of $290000
   Then User clicks the retirement projection button

TC_KS_004_kiwi saver retirement calculator for user who has age as 55
   [tags]   codebuild_ready    TC_kiwi_saver_004
   Given User go to the kiwisaver scheme retirement calculator
   When User clicks the get started button
   And User enters the current age as 55
   And User is not-employed
   And User has current kiwisaver balance as $140000
   And User has voluntary contributes of $010 per Anually
   And User selects risk profile as balanced
   And User has a saving goal of $200000
   Then User clicks the retirement projection button
