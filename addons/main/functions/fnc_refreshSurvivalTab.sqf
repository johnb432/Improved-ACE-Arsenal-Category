#include "script_component.hpp"

/*
 * Author: johnb43
 * Refreshes the survival items tab.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call improved_ace_arsenal_category_main_fnc_refreshSurvivalTab;
 *
 * Public: No
 */

// Add tab
if (GVAR(enableSurvivalTab)) then {
    // Add if non-existent
    if (isNil QGVAR(survivalTabSlot)) then {
        GVAR(survivalTabSlot) = [GVAR(survivalTabItems), "Survival", ICON_SURVIVAL] call ace_arsenal_fnc_addRightPanelButton;
    } else {
        // Modify items
        [GVAR(survivalTabItems), "Survival", ICON_SURVIVAL, GVAR(survivalTabSlot)] call ace_arsenal_fnc_addRightPanelButton;
    };
} else {
    // Remove tab
    ace_arsenal_customRightPanelButtons set [GVAR(survivalTabSlot), nil];
    GVAR(survivalTabSlot) = nil;
};
