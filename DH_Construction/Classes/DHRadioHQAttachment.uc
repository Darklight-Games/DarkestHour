//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHRadioHQAttachment extends DHConstructionAttachment;

var byte                TeamIndex;

var DHRadioHQ           Radio;
var class<DHRadioHQ>    RadioClass;
var Vector              RadioOffset;

simulated function MakeVisible();
simulated function MakeInvisible() { GotoState('Invisible'); }

function Setup()
{
    if (Radio == none)
    {
        Radio = Spawn(RadioClass, self);
    }

    if (Radio != none)
    {
        Radio.TeamIndex = TeamIndex;
        Radio.SetBase(self);
        Radio.SetRelativeLocation(RadioOffset);
    }
    else
    {
        Warn("Failed to spawn radio!");
    }
}

simulated state Invisible
{
    simulated function MakeVisible() { GotoState(''); }
    simulated function MakeInvisible();

    simulated function BeginState()
    {   
        if (Radio != none)
        {
            Radio.bHidden = true;
            Radio.AmbientSound = none;
        }

        bHidden = true;
    }

    simulated function EndState()
    {   
        if (Radio != none)
        {
            Radio.bHidden = false;
            Radio.AmbientSound = Radio.default.AmbientSound;
        }

        bHidden = false;
    }
}

simulated function Destroyed()
{
    if (Radio != none)
    {
        Radio.Destroy();
    }
}

defaultproperties
{
    StaticMesh=StaticMesh'DH_Construction_stc.GER_Artillery_Radio'

    RadioClass=Class'DHRadioHQ'
    RadioOffset=(Y=-10,Z=64)
}
