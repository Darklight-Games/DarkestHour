//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHMountedMachineGun extends DHMountedGun
    abstract;

// Overriden to remove cannon stuff and support MG features (destroyable gunsight).
simulated function Vector GetNewHitPointLocation(int Index)
{
    local Coords HitPointCoords;
    local Vector HitPointLocation;
    local DHMountedMGPawn MGP;
    local int             i;

    for (i = 0; i < WeaponPawns.Length; i++)
    {
        MGP = DHMountedMGPawn(WeaponPawns[i]);    
        
        if (MGP != none && (NewVehHitpoints[Index].bIsGun || NewVehHitpoints[Index].PointBone == MGP.GunsightCameraBone))
        {
            HitPointCoords = MGP.Gun.GetBoneCoords(NewVehHitpoints[Index].PointBone);
        }
    }        
    
    if (HitPointCoords.Origin == vect(0.0, 0.0, 0.0))
    {
        HitPointCoords = GetBoneCoords(NewVehHitpoints[Index].PointBone);
    }

    HitPointLocation = HitPointCoords.Origin;

    if (NewVehHitpoints[Index].PointOffset != vect(0.0, 0.0, 0.0))
    {
        HitPointLocation += NewVehHitpoints[Index].PointOffset >> Rotator(HitPointCoords.XAxis);
    }

    return HitPointLocation;
}

// There's nothing really to explode in mmgs.
function VehicleExplosion(Vector MomentumNormal, float PercentMomentum);

defaultproperties
{
    // In order for the collision meshes to actually work, for some reason there needs to be karma shapes.
    // However, we don't actually want the gun to move, so we set the max speed and angular speed to 0.
    Begin Object Class=KarmaParamsRBFull Name=KParams0
        KMaxSpeed=0.0
        KMaxAngularSpeed=0.0
    End Object
    KParams=KParams0

    NewVehHitpoints(0)=(PointRadius=5.5,PointBone="GUNSIGHT_CAMERA",PointOffset=(X=-4.6,Y=1,Z=-2.0),DamageMultiplier=50.0,NewHitPointType=NHP_GunOptics)
}   
