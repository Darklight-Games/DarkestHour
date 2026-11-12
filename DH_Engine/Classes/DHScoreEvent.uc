//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHScoreEvent extends Object
    abstract;

var localized string            HumanReadableName;
var class<DHScoreCategory>      CategoryClass;
var int                         Value;
var int                         LimitPerDuration;
var int                         LimitDurationSeconds;

function int GetValue()
{
    return default.Value;
}

defaultproperties
{
    LimitDurationSeconds=60
}
