//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHInfantryRadio extends DHRadio;

// Carried radios have no collision so they don't block the carrier's own traces.
// Other players interact with the radio by looking at the carrier (see DHPawn.NotifySelected).
defaultproperties
{
    AmbientSound=none
    bCollideActors=false
    bCanAutoTraceSelect=false
    bAutoTraceNotify=false
}
