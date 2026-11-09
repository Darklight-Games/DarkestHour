//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHConstructionAttachment extends Actor
    abstract;

function TakeDamage(int Damage, Pawn InstigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int HitIndex)
{
    local DHConstruction C;

    C = DHConstruction(Base);

    if (C != none)
    {
        C.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitIndex);
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
}