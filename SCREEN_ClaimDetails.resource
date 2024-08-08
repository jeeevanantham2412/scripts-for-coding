*** Settings ***
Library     String
Library     DateTime
Library     Collections
Resource    ./robots/modules/components/COMP_Button.resource
Resource    ./robots/modules/components/COMP_Textbox.resource
Resource    ./robots/utils/UTIL_Validation.resource
Resource    ./robots/utils/exceptions/EX_Exception.resource
Resource    ./robots/modules/screens/common/SCREEN_Header.resource
Resource    ./robots/utils/UTIL_BrowserHelper.resource


*** Keywords ***

mod-get-hospice-episode
    [Documentation]    Method is used to get hospice episode values.
    ...    OUTPUT:
    ...    ${hospice_episode}: List[Object]
    ...
    ...    THROWS:
    ...    E5.SYSTEM.MODULE.E0078::HOSPICE_EPISODE_SECTION_NOT_AVAILABLE_IN_ELIGIBILITY_PAGE.
    [Tags]    module
    TRY
        Log Message    <=== Get hospice episode module started ===>    INFO
        ${hospice_episode}=    SCREEN_AllScreenPage.get-hospice-episodes
        Log Message    <=== Get hospice episode module ended ===>    INFO
        RETURN    ${hospice_episode}
    EXCEPT    AS    ${module_exception}
        EX_Exception.ex-throw-module-system-exception-code    ${module_exception}
    END