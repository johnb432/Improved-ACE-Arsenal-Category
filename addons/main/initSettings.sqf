[
    QGVAR(enableMedicalTab),
    "CHECKBOX",
    ["Enable Medical Tab", "Allows the usage of the medical items tab."],
    COMPONENT_NAME,
    true,
    0,
    {
        call FUNC(refreshMedicalTab);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(medicalTabItemsSetting),
    "EDITBOX",
    ["Medical Tab Items", "Array of items allowed in the medical tab."],
    COMPONENT_NAME,
    '[
        "FirstAidKit",
        "Medikit",
        "ACE_elasticBandage",
        "ACE_packingBandage",
        "ACE_quikclot",
        "ACE_fieldDressing",
        "ACE_bloodIV",
        "ACE_bloodIV_500",
        "ACE_bloodIV_250",
        "ACE_plasmaIV",
        "ACE_plasmaIV_500",
        "ACE_plasmaIV_250",
        "ACE_salineIV",
        "ACE_salineIV_500",
        "ACE_salineIV_250",
        "ACE_epinephrine",
        "ACE_morphine",
        "ACE_adenosine",
        "ACE_splint",
        "ACE_tourniquet",
        "ACE_bodyBag",
        "ACE_surgicalKit",
        "ACE_personalAidKit"
    ]',
    0,
    {
        if (_this isEqualTo "") then {
            GVAR(medicalTabItems) = [];
            GVAR(medicalTabItemsSetting) = "[]";
        } else {
            // Make sure to remove invalid entries
            GVAR(medicalTabItems) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getItemConfig)}) - [""];
        };

        call FUNC(refreshMedicalTab);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(enableSurvivalTab),
    "CHECKBOX",
    ["Enable Survival Tab", "Allows the usage of the survival items tab."],
    COMPONENT_NAME,
    true,
    0,
    {
        call FUNC(refreshSurvivalTab);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(survivalTabItemsSetting),
    "EDITBOX",
    ["Survival Tab Items", "Array of items allowed in the survival tab."],
    COMPONENT_NAME,
    '[
        "ACE_Banana",
        "ACE_Can_Franta",
        "ACE_Can_RedGull",
        "ACE_Can_Spirit",
        "ACE_Canteen",
        "ACE_Canteen_Empty",
        "ACE_Canteen_Half",
        "ACE_Humanitarian_Ration",
        "ACE_MRE_BeefStew",
        "ACE_MRE_ChickenTikkaMasala",
        "ACE_MRE_ChickenHerbDumplings",
        "ACE_MRE_CreamChickenSoup",
        "ACE_MRE_CreamTomatoSoup",
        "ACE_MRE_LambCurry",
        "ACE_MRE_MeatballsPasta",
        "ACE_MRE_SteakVegetables",
        "ACE_Sunflower_Seeds",
        "ACE_WaterBottle",
        "ACE_WaterBottle_Empty",
        "ACE_WaterBottle_Half"
    ]',
    0,
    {
        if (_this isEqualTo "") then {
            GVAR(survivalTabItems) = [];
            GVAR(survivalTabItemsSetting) = "[]";
        } else {
            // Make sure to remove invalid entries
            GVAR(survivalTabItems) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getItemConfig)}) - [""];
        };

        call FUNC(refreshSurvivalTab);
    }
] call CBA_fnc_addSetting;
