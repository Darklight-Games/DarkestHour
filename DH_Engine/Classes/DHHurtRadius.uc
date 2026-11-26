//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHHurtRadius extends Actor
    notplaceable;

var int DamageAmount;
var float DamageRadius;
var class<DamageType> DamageType;

function Timer()
{
    if (DamageType == none)
    {
        return;
    }

    HurtRadius(DamageAmount, DamageRadius, DamageType, 0, Location);
}

function SetDamageTimerRate(float DamageTimerRate)
{
    SetTimer(DamageTimerRate, true);
}

defaultproperties
{
    RemoteRole=ROLE_None
    bHidden=true
    DamageRadius=1024.0
}

