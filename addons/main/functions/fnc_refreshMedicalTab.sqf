#include "script_component.hpp"

/*
 * Author: johnb43
 * Refreshes the medical items tab.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call improved_ace_arsenal_category_main_fnc_refreshMedicalTab;
 *
 * Public: No
 */

// Add tab
if (GVAR(enableMedicalTab)) then {
    // Add if non-existent
    if (isNil QGVAR(medicalTabSlot)) then {
        GVAR(medicalTabSlot) = [GVAR(medicalTabItems), "Medical", ICON_MEDICAL] call ace_arsenal_fnc_addRightPanelButton;
    } else {
        // Modify items
        [GVAR(medicalTabItems), "Medical", ICON_MEDICAL, GVAR(medicalTabSlot)] call ace_arsenal_fnc_addRightPanelButton;
    };
} else {
    // Remove tab
    ace_arsenal_customRightPanelButtons set [GVAR(medicalTabSlot), nil];
    GVAR(medicalTabSlot) = nil;
};
