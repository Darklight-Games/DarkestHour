//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHConstructionAttachment extends Actor
    abstract;

var float ConstructionForeachRadius;

function TakeDamage(int Damage, Pawn InstigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int HitIndex)
{
    local DHConstruction C;

    foreach RadiusActors(class'DHConstruction', C, ConstructionForeachRadius, Location)
    {
        break;
    }

    if (C != none)
    {
        C.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitIndex);
    }
}

defaultproperties
{
    ConstructionForeachRadius=150

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