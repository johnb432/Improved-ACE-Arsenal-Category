#include "..\script_component.hpp"
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

        // If all slots are full, notify player
        if (GVAR(survivalTabSlot) != -1) exitWith {};

        ["The survival tab could not be added because all custom arsenal tabs have been taken!", true, 5, 2] call ace_common_fnc_displayText;

        GVAR(survivalTabSlot) = nil;
    } else {
        // Modify items
        [GVAR(survivalTabItems), "Survival", ICON_SURVIVAL, GVAR(survivalTabSlot)] call ace_arsenal_fnc_addRightPanelButton;
    };
} else {
    if (isNil QGVAR(survivalTabSlot)) exitWith {};

    // Remove tab
    ace_arsenal_customRightPanelButtons deleteAt GVAR(survivalTabSlot);
    GVAR(survivalTabSlot) = nil;
};
