//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHRadioHQAttachment extends DHRadio;

simulated function MakeVisible();
simulated function MakeInvisible() { GotoState('Invisible'); }

simulated function ERadioUsageError GetRadioUsageError(Pawn User)
{
    local DHSpawnPoint_PlatoonHQ SP;

    foreach RadiusActors(Class'DHSpawnPoint_PlatoonHQ', SP, 115, Location)
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

simulated state Invisible
{
    simulated function MakeVisible() { GotoState(''); }
    simulated function MakeInvisible();

    simulated function BeginState()
    {
        bHidden = true;
        AmbientSound = none;
    }

    simulated function EndState()
    {
        bHidden = false;
        AmbientSound = default.AmbientSound;
    }
}

defaultproperties
{
    DrawType=DT_StaticMesh
    RemoteRole=ROLE_DumbProxy

    NetUpdateFrequency=10.0
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true

    bUseCylinderCollision=false
    bCollideActors=true
    bCollideWorld=false
    bBlockActors=true
    bBlockKarma=true

    bBlockZeroExtentTraces=true
    bBlockNonZeroExtentTraces=true
    bBlockProjectiles=true
    bProjTarget=true
    bPathColliding=true
    bWorldGeometry=true

    StaticMesh=StaticMesh'DH_Construction_stc.GER_Artillery_Radio'

    bShouldShowOnSituationMap=false
}
