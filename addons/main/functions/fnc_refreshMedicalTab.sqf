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
    // If KAT is loaded, try to find KAT's arsenal tab, but only once
    if (isNil QGVAR(foundKAT)) then {
        GVAR(foundKAT) = true;

        if !(isClass (configFile >> "CfgPatches" >> "kat_misc") && {GETMVAR("kat_misc_arsenalMedCategory",false)}) exitWith {};

        private _index = ace_arsenal_customRightPanelButtons findIf {_x select 1 == ICON_MEDICAL_ACE};

        // If not found, make new tab
        if (_index == -1) exitWith {};

        GVAR(medicalTabSlot) = _index;
    };

    private _medicalText = "Medical";
    private _medicalIcon = ICON_MEDICAL;

    // Use ACE's icons and text if present
    if (isClass (configFile >> "CfgPatches" >> "ace_medical_gui")) then {
        _medicalText = localize "STR_ACE_Medical_GUI_Medical";
        _medicalIcon = ICON_MEDICAL_ACE;
    };

    // Add if non-existent
    if (isNil QGVAR(medicalTabSlot)) then {
        GVAR(medicalTabSlot) = [GVAR(medicalTabItems) + GVAR(medicalTabItemsKAT), _medicalText, _medicalIcon] call ace_arsenal_fnc_addRightPanelButton;

        // If all slots are full, notify player
        if (GVAR(medicalTabSlot) != -1) exitWith {};

        ["The medical tab could not be added because all custom arsenal tabs have been taken!", true, 5, 2] call ace_common_fnc_displayText;

        GVAR(medicalTabSlot) = nil;
    } else {
        // Modify items
        [GVAR(medicalTabItems) + GVAR(medicalTabItemsKAT), _medicalText, _medicalIcon, GVAR(medicalTabSlot)] call ace_arsenal_fnc_addRightPanelButton;
    };
} else {
    // Remove tab
    if (isNil QGVAR(medicalTabSlot)) exitWith {};

    ace_arsenal_customRightPanelButtons deleteAt GVAR(medicalTabSlot);
    GVAR(medicalTabSlot) = nil;
};
