//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHRadioHQ extends DHRadio;

simulated function ERadioUsageError GetRadioUsageError(Pawn User)
{
    local DHSpawnPoint_PlatoonHQ SP;

    foreach RadiusActors(Class'DHSpawnPoint_PlatoonHQ', SP, 140, Location)
    {
        break;
    }

    if (SP == none)
    {
        return ERROR_Fatal;
    }

    if (!SP.bIsEstablished)
    {
        return ERROR_Calibrating;
    }

    return super.GetRadioUsageError(User);
}

defaultproperties
{
    bShouldShowOnSituationMap=false
}
