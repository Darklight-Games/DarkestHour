//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHRadioHQ extends DHRadio;

simulated function ERadioUsageError GetRadioUsageError(Pawn User)
{
    local DHSpawnPoint_PlatoonHQ SP;
    local DHConstruction_PlatoonHQ HQ;

    HQ = DHConstruction_PlatoonHQ(Base.Base);

    if (HQ == none)
    {
        return ERROR_Fatal;
    }
    
    SP = HQ.SpawnPoint;

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
