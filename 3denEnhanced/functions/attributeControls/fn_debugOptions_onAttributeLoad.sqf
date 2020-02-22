/*
   Author: R3vo

   Date: 2019-07-15

   Description:
   Used by the airdrop attribute. Call when attribute is loaded.

   Parameter(s):
   0: CONTROL - Controls group

   Returns:
   BOOLEAN: true
*/

private _options =
[
	["STR_ENH_DEBUGOPTIONS_SHOWUNITS_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_SHOWUNITS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_BULLETTRACKING_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_BULLETTRACKING_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_ZEUS_DISPLAYNAME",""],
	["STR_ENH_DEBUGOPTIONS_ARSENAL_DISPLAYNAME",""],
	["STR_ENH_DEBUGOPTIONS_GARAGE_DISPLAYNAME",""],
	["STR_ENH_DEBUGOPTIONS_INVULNERABILITY_DISPLAYNAME",""],
	["STR_ENH_CAPTIVE_DISPLAYNAME","STR_ENH_CAPTIVE_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_STAMINA_DISPLAYNAME",""],
	["STR_ENH_DEBUGOPTIONS_FPS_DISPLAYNAME",""],
	["STR_ENH_DEBUGOPTIONS_KILLBLUFOR_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_KILLUNITS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_KILLOPFOR_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_KILLUNITS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_KILLINDFOR_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_KILLUNITS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_KILLCIVFOR_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_KILLUNITS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_KILLCURSOR_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_KILLUNITS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_DRAWICONS_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_DRAWICONS_TOOLTIP"],
	["STR_ENH_DEBUGOPTIONS_DELETECORPSE_DISPLAYNAME",""],
	["STR_ENH_DEBUGOPTIONS_SHOWWAYPOINTS_DISPLAYNAME","STR_ENH_DEBUGOPTIONS_SHOWWAYPOINTS_TOOLTIP"]
];

params ["_ctrlGroup"];

private _ctrlLB  = _ctrlGroup controlsGroupCtrl 100;
private _enabledOptions = profileNamespace getVariable ["ENH_DebugOptions_Settings",[]];

{
	_x params ["_displayName","_tooltip"];
	
	private _state = if (_forEachIndex in _enabledOptions) then
	{
		["\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa",1];
	}
	else
	{
		["\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa",0];
	};

	_ctrlLB lbAdd localize _displayName;
	_ctrlLB lbSetTooltip [_forEachIndex,localize _tooltip];
	_ctrlLB lbSetPicture [_forEachIndex,_state select 0];
	_ctrlLB lbSetValue [_forEachIndex,_state select 1];
} foreach _options;

true