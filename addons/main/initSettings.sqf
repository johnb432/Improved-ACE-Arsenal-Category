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
            GVAR(medicalTabItemsSetting) = '[]';
        } else {
            // Make sure to remove invalid entries
            GVAR(medicalTabItems) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getItemConfig)}) - [""];
        };

        call FUNC(refreshMedicalTab);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(medicalTabItemsKATSetting),
    "EDITBOX",
    ["Medical Tab Items KAT + ACE Pharmacy", "Array of items from KAT and ACE Pharmacy allowed in the medical tab."],
    COMPONENT_NAME,
    '[
        "Attachable_Helistretcher",
        "kat_aatKit","kat_accuvac","kat_AED","kat_X_AED","kat_crossPanel",
        "kat_chestSeal","kat_larynx","kat_guedel","kat_Pulseoximeter","kat_stethoscope",
        "kat_scalpel","kat_retractor","kat_clamp","kat_plate","kat_vacuum",
        "kat_bloodIV_O","kat_bloodIV_A","kat_bloodIV_AB","kat_bloodIV_B",
        "kat_bloodIV_O_N","kat_bloodIV_A_N","kat_bloodIV_AB_N","kat_bloodIV_B_N",
        "kat_bloodIV_O_500","kat_bloodIV_A_500","kat_bloodIV_AB_500","kat_bloodIV_B_500",
        "kat_bloodIV_O_N_500","kat_bloodIV_A_N_500","kat_bloodIV_AB_N_500","kat_bloodIV_B_N_500",
        "kat_bloodIV_O_250","kat_bloodIV_A_250","kat_bloodIV_AB_250","kat_bloodIV_B_250",
        "kat_bloodIV_O_N_250","kat_bloodIV_A_N_250","kat_bloodIV_AB_N_250","kat_bloodIV_B_N_250",
        "KAT_Empty_bloodIV_250","KAT_Empty_bloodIV_500",
        "kat_CarbonateItem","kat_PainkillerItem","kat_IV_16","kat_IO_FAST","kat_naloxone","kat_EACA","kat_TXA",
        "kat_norepinephrine","kat_phenylephrine","kat_nitroglycerin","kat_amiodarone","kat_lidocaine","kat_atropine",
        "kat_ketamine","kat_fentanyl","kat_nalbuphine","kat_lorazepam","kat_flumazenil","kat_etomidate",
        "kat_phenylephrine_inject"
    ]',
    0,
    {
        if (_this isEqualTo "") then {
            GVAR(medicalTabItemsKAT) = [];
            GVAR(medicalTabItemsKATSetting) = '[]';
        } else {
            // Make sure to remove invalid entries
            GVAR(medicalTabItemsKAT) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getItemConfig)}) - [""];
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
            GVAR(survivalTabItemsSetting) = '[]';
        } else {
            // Make sure to remove invalid entries
            GVAR(survivalTabItems) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getItemConfig)}) - [""];
        };

        call FUNC(refreshSurvivalTab);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(enableToolTab),
    "CHECKBOX",
    ["Enable Tool Tab", "Allows the usage of the tool items tab."],
    COMPONENT_NAME,
    true,
    0,
    {
        call FUNC(refreshToolTab);
    }
] call CBA_fnc_addSetting;

[
    QGVAR(toolTabItemsSetting),
    "EDITBOX",
    ["Tool Tab Items", "Array of items allowed in the tool tab."],
    COMPONENT_NAME,
    '[
        "MineDetector",
        "ToolKit",
        "ACE_DefusalKit",
        "ACE_EntrenchingTool",
        "ACE_Fortify",
        "ACE_wirecutter"
    ]',
    0,
    {
        if (_this isEqualTo "") then {
            GVAR(toolTabItems) = [];
            GVAR(toolTabItemsSetting) = '[]';
        } else {
            // Make sure to remove invalid entries
            GVAR(toolTabItems) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getItemConfig)}) - [""];
        };

        call FUNC(refreshToolTab);
    }
] call CBA_fnc_addSetting;
