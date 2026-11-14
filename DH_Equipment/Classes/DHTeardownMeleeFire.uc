//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHTeardownMeleeFire extends DHMeleeFire
    abstract;

var Sound TearDownSound;

function Sound GetGroundBashSound(Actor HitActor, Material HitMaterial)
{
    local DHConstruction C;
    local DHConstructionAttachment CA;
    
    C = DHConstruction(HitActor);

    if (C != none && C.CanTakeTearDownDamageFromPawn(Instigator))
    {
        return TearDownSound;
    }

    CA = DHConstructionAttachment(HitActor);

    if (CA != none && CA.CanTakeTearDownDamageFromPawn(Instigator))
    {
        return TearDownSound;   
    }

    return super.GetGroundBashSound(HitActor, HitMaterial);
}

defaultproperties
{
    FireRate=0.21
}
