#include "\x\cba\addons\main\script_macros_common.hpp"

// This part includes parts of the CBA and ACE3 macro libraries
#define GETMVAR(var1,var2) (missionNamespace getVariable [ARR_2(var1,var2)])

#define ICON_MEDICAL "\A3\ui_f\data\igui\cfg\actions\heal_ca.paa"
#define ICON_MEDICAL_ACE "\z\ace\addons\medical_gui\data\categories\triage_card.paa"
#define ICON_SURVIVAL "\z\ace\addons\common\data\icon_banana_ca.paa"
#define ICON_TOOL "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif
