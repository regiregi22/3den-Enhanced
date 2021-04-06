/*
  Author: R3vo

  Date: 2020-06-14

  Description:
  Used by the ENH_InventoryManager GUI. Used to remove items from inventory listbox.

  Parameter(s):
  0: CONTROL - Control Button
  1: NUMBER - The amount that should be removed

  Returns:
  BOOLEAN: true/false
*/

#include "\3denEnhanced\ENH_defineCommon.hpp"

disableSerialization;
params ["_amount"];
private _display = uiNamespace getVariable "Enh_Display_InventoryManager";
private _ctrlInventory = CTRL(IDC_IM_INVENTORYLIST);
private _row = lnbCurSelRow  _ctrlInventory;

if (_row == -1) exitWith {false};

private _currentAmount = _ctrlInventory lnbValue [_row, 1];
private _newAmount = _currentAmount - _amount;

if (_newAmount <= 0) exitWith
{
  _ctrlInventory lnbDeleteRow _row;
  true
};

_ctrlInventory lnbSetText [[_row, 2], str _newAmount];
_ctrlInventory lnbSetValue [[_row, 1], _newAmount];

true