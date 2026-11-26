//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// Base class for HUD messages that compete for the same space on the HUD.
// Only one message per category is displayed at a time. A new message displaces
// the existing one if its weight is greater than or equal to the existing
// message's weight, otherwise the new message is discarded.
//==============================================================================

class DHHudMessage extends LocalMessage
    abstract;

enum EHudArea
{
    AREA_None, // No arbitration (normal LocalMessage behavior).
    AREA_BottomCenter, // Prompts and errors around the bottom-center of the screen.
    AREA_TopCenter, // Team information banners at the top-center of the screen.
};

var EHudArea Area;
var byte Priority;

defaultproperties
{
    Area=AREA_None
}
