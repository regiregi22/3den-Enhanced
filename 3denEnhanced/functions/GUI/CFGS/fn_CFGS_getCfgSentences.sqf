/*
  Author: R3vo

  Date: 2020-10-20

  Description:
  Used by the CfgSentences Browser GUI. Searches through CfgSentences and retrieves all classes.

  Parameter(s):
  0: STRING - Filter, can be ALL or anything else

  Returns:
  -
*/

#include "\3denEnhanced\defines\ENH_defineCommon.hpp"

private _display = uiNamespace getVariable ["ENH_CFGS_Display", displayNull];
private _tv = CTRL(IDC_SENTENCES_LIST);
private _ctrlFilter = CTRL(IDC_SENTENCES_PAGES);
private _ctrlCount = CTRL(IDC_SENTENCES_COUNT);
private _counter = 0;

params [["_filter", "ALL"]];

tvClear _tv;

{
  if (_filter == "ALL" || {_filter in toUpper configName _x}) then //Only filter if filter is not "all"
  {
    _indexMission = _tv tvAdd [[], toUpper configName _x];
    _topics = "true" configClasses (_x);
    {
      _indexDialogue = _tv tvAdd [[_indexMission], toUpper configName _x];
      _sentences = "true" configClasses (_x >> "Sentences");
      {
        _text = getText (_x >> "text");
        if (_text == "") then {_text = getText (_x >> "textPlain")};
        if (_text == "") then {_text = str _x};

        _soundArray = getArray (_x >> "speech");
        if !(_soundArray isEqualTo []) then
        {
          _tv tvAdd [[_indexMission, _indexDialogue], _text];
          _tv tvSetData [[_indexMission, _indexDialogue, _forEachIndex], str _x];
          _counter = _counter + 1;
        };
      } forEach _sentences;
    } forEach _topics;
    _tv tvSort [[_indexMission], false];
  };
} forEach ("true" configClasses (configFile >> "CfgSentences"));

_tv tvSort [[], false];
_ctrlCount ctrlSetText ("#" +  str _counter);