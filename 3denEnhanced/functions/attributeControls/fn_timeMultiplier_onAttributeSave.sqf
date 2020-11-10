/*
    Author: R3vo

    Date: 2019-07-15

    Description:
    Used by the time multiplier attribute. Call when attribute is saved.

    Parameter(s):
    0: CONTROL - Controls group

    Returns:
    NUMBER: Attribute value
*/

params ["_ctrlGroup"];

sliderposition (_ctrlGroup controlsGroupCtrl 100)