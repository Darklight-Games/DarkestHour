//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_EyeEGun extends DHVehicleAutoCannon;

// Override the main fire command to apply the safety vector push instantly
function Fire(Controller C)
{
    local coords BoneCoords;
    local vector ForwardVector;
    local float SafetyDistance;

    // 1. Calculate the real-time forward push vector right as the trigger is pulled
    if (Base != none && WeaponFireAttachmentBone != 'None')
    {
        BoneCoords = Base.GetBoneCoords(WeaponFireAttachmentBone);
        
        ForwardVector = Normal(Vector(WeaponFireRotation)); 
        if (ForwardVector == vect(0,0,0)) 
        {
            ForwardVector = BoneCoords.XAxis; 
        }

        // Safety offset in Unreal Units to clear the vehicle structure instantly
        SafetyDistance = 400.000000; 

        // Update the internal firing location variable before passing control up
        WeaponFireLocation = BoneCoords.Origin + (ForwardVector * SafetyDistance);
    }

    // 2. Pass control to the engine to execute the shot, play visuals, and spawn the shell instantly
    super.Fire(C);
}

// Intercept the projectile precisely as it spawns to strip its ability to hit the vehicle hull
function Projectile SpawnProjectile(class<Projectile> ProjClass, bool bAltFire)
{
    local Projectile SpawnedProj;

    // A. Run the native spawning logic
    SpawnedProj = super.SpawnProjectile(ProjClass, bAltFire);

    // B. Inject the collision pass-through logic (with zero effect on AmbientSound)
    if (SpawnedProj != none && Base != none)
    {
        SpawnedProj.Instigator = Instigator;
        
        if (Instigator != none)
        {
            SpawnedProj.Disable('Touch'); // Bypasses immediate frame-0 contact checks
        }
    }

    return SpawnedProj;
}

defaultproperties
{
    // mesh
    Mesh=SkeletalMesh'DH_UFO_anm.UFO_turret_ext'
    bForceSkelUpdate=true // necessary for new player hit detection system, as makes server update the MG mesh skeleton, which it wouldn't otherwise as server doesn't draw mesh

    // Movement
    YawBone="Turret"
    YawStartConstraint=-8000.000000
    YawEndConstraint=8000.000000
    PitchBone="Turret_placement3"
    PitchUpLimit=10000
    PitchDownLimit=35000
    GunnerAttachmentBone="com_attachment"
    bLimitYaw = true
    RotationsPerSecond=1
    MaxPositiveYaw=8500
    MaxNegativeYaw=-8500
    CustomPitchUpLimit=10000
    CustomPitchDownLimit=35000

    // Ammo
    bMultipleRoundTypes=False
    PrimaryProjectileClass=Class'DH_KnifeRed'

    InitialPrimaryAmmo=5000
    NumPrimaryMags=200

    Spread=0.02
    AltFireSpread=0.3
    FireInterval=0.3

    // Weapon fire
    WeaponFireAttachmentBone="tip"
    AltFireAttachmentBone="tip"
    AmbientEffectEmitterClass=none
    CannonFireSound(0)=Sound'DH_UFO_snd.UFO.UfoFireAlt_End'
    CannonFireSound(1)=Sound'DH_UFO_snd.UFO.UfoFireAlt_End'
    CannonFireSound(2)=Sound'DH_UFO_snd.UFO.UfoFireAlt_End'

    ShakeOffsetMag=(X=0.5,Y=0.0,Z=0.2)
    ShakeOffsetRate=(X=500.0,Y=500.0,Z=500.0)
    ShakeRotMag=(X=25.0,Y=0.0,Z=10.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)

    AltFireSoundClass=Sound'DH_UFO_snd.UFO.EyeSmallShotC'
    AltFireEndSound=none

    // Coaxial MG ammo
    AltFireProjectileClass=Class'DH_KunaiRed'
    InitialAltAmmo=43000
    NumMGMags=150
    AltFireInterval=0.07
    TracerProjectileClass=Class'DH_KunaiBlue'
    TracerFrequency=9

    AltFireSoundScaling=0.7

    // Reload (i cant get it to work)
    //HUDOverlayReloadAnim="Bipod_Reload_s"
    ReloadStages(0)=(Sound=Sound'DH_UFO_snd.UFO.UfoCharge',Duration=1.97) //
    ReloadStages(1)=(Sound=none,Duration=0.06)
    ReloadStages(2)=(Sound=none,Duration=0.02)
    ReloadStages(3)=(Sound=none,Duration=0.03)

    AltReloadStages(0)=(Sound=Sound'DH_UFO_snd.UFO.UfoChargeTwo',Duration=1.97) //
    AltReloadStages(1)=(Sound=none,Duration=0.06)
    AltReloadStages(2)=(Sound=none,Duration=0.02)
    AltReloadStages(3)=(Sound=none,Duration=0.03)
}
