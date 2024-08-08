*** Settings ***
Resource    ./utils/SCREEN_ClaimDetails.resource
Resource    ./robots/__tests__/common/util.resource

Suite Setup     util.init


*** Variables ***
${COMMON_EXCEPTION_WELLSKY_POPUP_OPENED_URL}    
${VALUE_NOT_POPULATED_IN_ADD_COMMENT_TEXTBOX_IN_CLAIM_DETAILS_PAGE_URL}    
${ADDED_COMMENT_TIMSTAMP_NOT_FOUND_IN_CLAIM_DETAILS_PAGE_URL}    
${POST_CONDITION_FAILED_FOR_ADD_COMMENT_IN_CLAIM_DETAILS_PAG_URL}    
${ADD_COMMENT_TEXTBOX_NOT_ATTACHED_IN_CLAIM_DETAILS_PAGE_URL}    
${UNKNOWN_ERROR_OCCURRED_URL}    
${ADD_COMMENT_BUTTON_NOT_ATTACHED_IN_CLAIM_DETAILS_PAGE_URL}    
${ADD_COMMENT_BUTTON_NOT_ENABLED_IN_CLAIM_DETAILS_PAGE_URL}    
${MOD_ADD_COMMENT_POSITIVE_URL}    
${CLAIM_DETAILS_PAGE_NOT_FOUND_URL}    
${ADD_COMMENT_TEXTBOX_IS_NOT_A_TEXTBOX_IN_CLAIM_DETAILS_PAGE_URL}    
${CHECK_ICON_BUTTON_NOT_VISIBLE_IN_CLAIM_DETAILS_PAGE_URL}    
${MOD_VAILDATE_COMMENT_POSITIVE_URL}    
${ADD_COMMENT_BUTTON_NOT_VISIBLE_IN_CLAIM_DETAILS_PAGE_URL}    
${CHECK_ICON_BUTTON_NOT_ATTACHED_IN_CLAIM_DETAILS_PAGE_URL}    
${ADD_COMMENT_TEXTBOX_NOT_VISIBLE_IN_CLAIM_DETAILS_PAGE_URL}    
${ADD_COMMENT_TEXTBOX_NOT_EDITABLE_IN_CLAIM_DETAILS_PAGE_URL}    
${ADD_COMMENT_BUTTON_IS_NOT_A_BUTTON_IN_CLAIM_DETAILS_PAGE_URL}    
${CHECK_ICON_BUTTON_NOT_ENABLED_IN_CLAIM_DETAILS_PAGE_URL}    
${CHECK_ICON_BUTTON_IS_NOT_A_BUTTON_IN_CLAIM_DETAILS_PAGE_URL}    
${CLAIM_DETAILS_PAGE_NOT_LOADED_URL}    


*** Test Cases ***
Positive - Mod add comment
    [Tags]    mod_add_comment_positive    
    New Page    ${MOD_ADD_COMMENT_POSITIVE_URL}
    SCREEN_ClaimDetails.mod-add-comment
    Log To Console    <====Mod add comment positive case run successfully====>

Negative - Claim details page not loaded
    [Tags]    mod-add-comment_negative    
    New Page    ${CLAIM_DETAILS_PAGE_NOT_LOADED_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E074
    END
    Log To Console    <====Claim details page not loaded negative case run successfully====>

Negative - Claim details page not found
    [Tags]    mod-add-comment_negative    
    New Page    ${CLAIM_DETAILS_PAGE_NOT_FOUND_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E075
    END
    Log To Console    <====Claim details page not found negative case run successfully====>

Negative - Add comment button not attached in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_BUTTON_NOT_ATTACHED_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E076
    END
    Log To Console    <====Add comment button not attached in claim details page negative case run successfully====>

Negative - Add comment button is not a button in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_BUTTON_IS_NOT_A_BUTTON_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E077
    END
    Log To Console    <====Add comment button is not a button in claim details page negative case run successfully====>

Negative - Add comment button not visible in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_BUTTON_NOT_VISIBLE_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E078
    END
    Log To Console    <====Add comment button not visible in claim details page negative case run successfully====>

Negative - Add comment button not enabled in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_BUTTON_NOT_ENABLED_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E079
    END
    Log To Console    <====Add comment button not enabled in claim details page negative case run successfully====>

Negative - Add comment textbox not attached in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_TEXTBOX_NOT_ATTACHED_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E080
    END
    Log To Console    <====Add comment textbox not attached in claim details page negative case run successfully====>

Negative - Add comment textbox is not a textbox in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_TEXTBOX_IS_NOT_A_TEXTBOX_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E081
    END
    Log To Console    <====Add comment textbox is not a textbox in claim details page negative case run successfully====>

Negative - Add comment textbox not visible in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_TEXTBOX_NOT_VISIBLE_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E082
    END
    Log To Console    <====Add comment textbox not visible in claim details page negative case run successfully====>

Negative - Add comment textbox not editable in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${ADD_COMMENT_TEXTBOX_NOT_EDITABLE_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E083
    END
    Log To Console    <====Add comment textbox not editable in claim details page negative case run successfully====>

Negative - Value not populated in add comment textbox in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${VALUE_NOT_POPULATED_IN_ADD_COMMENT_TEXTBOX_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E084
    END
    Log To Console    <====Value not populated in add comment textbox in claim details page negative case run successfully====>

Negative - Check icon button not attached in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${CHECK_ICON_BUTTON_NOT_ATTACHED_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E085
    END
    Log To Console    <====Check icon button not attached in claim details page negative case run successfully====>

Negative - Check icon button is not a button in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${CHECK_ICON_BUTTON_IS_NOT_A_BUTTON_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E086
    END
    Log To Console    <====Check icon button is not a button in claim details page negative case run successfully====>

Negative - Check icon button not visible in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${CHECK_ICON_BUTTON_NOT_VISIBLE_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E087
    END
    Log To Console    <====Check icon button not visible in claim details page negative case run successfully====>

Negative - Check icon button not enabled in claim details page
    [Tags]    mod-add-comment_negative    
    New Page    ${CHECK_ICON_BUTTON_NOT_ENABLED_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E088
    END
    Log To Console    <====Check icon button not enabled in claim details page negative case run successfully====>

Negative - Common exception wellsky popup opened
    [Tags]    mod-add-comment_negative    
    New Page    ${COMMON_EXCEPTION_WELLSKY_POPUP_OPENED_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E096
    END
    Log To Console    <====Common exception wellsky popup opened negative case run successfully====>

Negative - Unknown error occurred
    [Tags]    mod-add-comment_negative    
    New Page    ${UNKNOWN_ERROR_OCCURRED_URL}
    TRY
        SCREEN_ClaimDetails.mod-add-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E097
    END
    Log To Console    <====Unknown error occurred negative case run successfully====>

Positive - Mod vaildate comment
    [Tags]    mod_vaildate_comment_positive    
    New Page    ${MOD_VAILDATE_COMMENT_POSITIVE_URL}
    SCREEN_ClaimDetails.mod-vaildate-comment
    Log To Console    <====Mod vaildate comment positive case run successfully====>

Negative - Claim details page not loaded
    [Tags]    mod-vaildate-comment_negative    
    New Page    ${CLAIM_DETAILS_PAGE_NOT_LOADED_URL}
    TRY
        SCREEN_ClaimDetails.mod-vaildate-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E074
    END
    Log To Console    <====Claim details page not loaded negative case run successfully====>

Negative - Claim details page not found
    [Tags]    mod-vaildate-comment_negative    
    New Page    ${CLAIM_DETAILS_PAGE_NOT_FOUND_URL}
    TRY
        SCREEN_ClaimDetails.mod-vaildate-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E075
    END
    Log To Console    <====Claim details page not found negative case run successfully====>

Negative - Added comment timstamp not found in claim details page
    [Tags]    mod-vaildate-comment_negative    
    New Page    ${ADDED_COMMENT_TIMSTAMP_NOT_FOUND_IN_CLAIM_DETAILS_PAGE_URL}
    TRY
        SCREEN_ClaimDetails.mod-vaildate-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E089
    END
    Log To Console    <====Added comment timstamp not found in claim details page negative case run successfully====>

Negative - Post condition failed for add comment in claim details pag
    [Tags]    mod-vaildate-comment_negative    
    New Page    ${POST_CONDITION_FAILED_FOR_ADD_COMMENT_IN_CLAIM_DETAILS_PAG_URL}
    TRY
        SCREEN_ClaimDetails.mod-vaildate-comment
    EXCEPT    AS    ${error_code}
        Log To Console    ${error_code}
        Should Be Equal    ${error_code}        ...    E5.MODULE.SYSTEM.E090
    END
    Log To Console    <====Post condition failed for add comment in claim details pag negative case run successfully====>

