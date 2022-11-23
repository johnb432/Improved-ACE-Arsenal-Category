#include "script_component.hpp"

/*
 * Author: johnb43
 * Refreshes the tools tab.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call improved_ace_arsenal_category_main_fnc_refreshToolTab;
 *
 * Public: No
 */

// Add tab
if (GVAR(enableToolTab)) then {
    // Add if non-existent
    if (isNil QGVAR(toolTabSlot)) then {
        GVAR(toolTabSlot) = [GVAR(toolTabItems), "Tools", ICON_TOOL] call ace_arsenal_fnc_addRightPanelButton;

        // If all slots are full, notify player
        if (GVAR(toolTabSlot) == -1) then {
            ["The tool tab could not be added because all custom arsenal tabs have been taken!", true, 5, 2] call ace_common_fnc_displayText;

            GVAR(toolTabSlot) = nil;
        };
    } else {
        // Modify items
        [GVAR(toolTabItems), "Tools", ICON_TOOL, GVAR(toolTabSlot)] call ace_arsenal_fnc_addRightPanelButton;
    };
} else {
    if (isNil QGVAR(toolTabSlot)) exitWith {};

    // Remove tab
    ace_arsenal_customRightPanelButtons set [GVAR(toolTabSlot), nil];
    GVAR(toolTabSlot) = nil;
};
