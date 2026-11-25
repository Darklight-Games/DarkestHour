//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_GapCannon extends DHVehicleAutoCannon;

// --- Delayed Firing Variables ---
var() float PrimaryFireDelay;      // Set to 1.0 in defaultproperties
var   bool  bDelayActive;
var   Controller DelayedController; // Stores who pulled the trigger

var sound SavedCannonFireSound[3]; 

// Intercept the projectile right as it spawns to strip its ability to hit the firing vehicle
function Projectile SpawnProjectile(class<Projectile> ProjClass, bool bAltFire)
{
    local Projectile SpawnedProj;

    // 1. Call the parent spawning logic to create the projectile actor
    SpawnedProj = super.SpawnProjectile(ProjClass, bAltFire);

    // 2. Configure UE2.5 native collision bypass parameters WITHOUT breaking AmbientSound
    if (SpawnedProj != none && Base != none)
    {
        // Explicitly set the vehicle base (the UFO hull) as the instigator
        SpawnedProj.Instigator = Instigator;
        
        // Tells the engine that the projectile is allowed to travel right through this instigator 
        // without registering structural damage checks or collision blocks.
        // This keeps the projectile independent so its AmbientSound moves along its flight vector.
        if (Instigator != none)
        {
            SpawnedProj.Disable('Touch'); // Safety bypass for immediate frame 0 contact
        }
    }

    return SpawnedProj;
}

// 1. Intercept the fire command: play visuals and audio instantly
function Fire(Controller C)
{
    local sound SelectedSound;

    if (bDelayActive)
    {
        return;
    }

    // A. Manually play the firing sound immediately
    SelectedSound = CannonFireSound[Rand(3)];
    if (SelectedSound != none)
    {
        PlayOwnedSound(SelectedSound, SLOT_None, 2.0, false, 5000.0, 1.0, true);
    }

    // B. Trigger visual and smoke effects instantly
    if (Level.NetMode != NM_DedicatedServer)
    {
        FlashMuzzleFlash(false); 
        
        if (ShellCaseEmitter != none)
        {
            ShellCaseEmitter.Trigger(self, Instigator);
        }

        if (Instigator != none && Instigator.IsLocallyControlled())
        {
            PlayAnim('Shoot', 1.0, 0.1); 
        }
    }

    // C. Lock the weapon state and prepare the 1-second delay
    DelayedController = C;
    bDelayActive = true;
    SetTimer(PrimaryFireDelay, false);
}

// 2. Triggers 1 second later to launch the projectile from the MOVING vehicle
simulated function Timer()
{
    local int i;
    local coords BoneCoords;
    local vector ForwardVector;
    local float SafetyDistance;

    bDelayActive = false;

    // Recalculate spawn vector safely without breaking attachment constraints
    if (Base != none && WeaponFireAttachmentBone != 'None')
    {
        BoneCoords = Base.GetBoneCoords(WeaponFireAttachmentBone);
        
        // 1. Determine the exact forward direction the barrel is facing right now
        ForwardVector = Normal(Vector(WeaponFireRotation)); 
        if (ForwardVector == vect(0,0,0)) 
        {
            ForwardVector = BoneCoords.XAxis; 
        }

        // 2. Set a safety offset in Unreal Units (e.g., 200 units pushing it forward)
        // Adjust this number if you still experience self-hits during extreme turns
        SafetyDistance = 200.000000; 

        // 3. Update the spawn location forward, clearing the ship's internal cockpit collision box
        WeaponFireLocation = BoneCoords.Origin + (ForwardVector * SafetyDistance);
    }

    // E. Backup and Clear the CannonFireSounds so the engine spawns the round silently
    for (i = 0; i < 3; i++)
    {
        SavedCannonFireSound[i] = CannonFireSound[i];
        CannonFireSound[i] = none;
    }

    // F. Execute the projectile spawn code at our safely pushed coordinate space
    super.Fire(DelayedController); 

    // G. Restore the sounds immediately for the next shot
    for (i = 0; i < 3; i++)
    {
        CannonFireSound[i] = SavedCannonFireSound[i];
    }

    DelayedController = none;
}

defaultproperties
{
    PrimaryFireDelay=1.700000
    bDelayActive=false
    DelayedController=none
     AmbientGlow=224
     bUseDynamicLights=true
     bUseLightingFromBase=true
     //LightType=LT_SubtlePulse
    // LightEffect=LE_TorchWaver
     LightRadius=555
     LightBrightness=200
     LightPeriod=2
     bLightingVisibility=True
    // mesh
    Mesh=SkeletalMesh'DH_UFO_anm.GapTurret'
    bForceSkelUpdate=true // necessary for new player hit detection system, as makes server update the MG mesh skeleton, which it wouldn't otherwise as server doesn't draw mesh

    // Movement
    YawBone="Turret"
    YawStartConstraint=-8000.000000
    YawEndConstraint=8000.000000
    PitchBone="Turret_placement1"
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
    PrimaryProjectileClass=Class'DH_GapTrainBullet'

    InitialPrimaryAmmo=5000
    NumPrimaryMags=20000

    Spread=0.01
    AltFireSpread=0.01
    FireInterval=10
    AltFireInterval=1

    // Weapon fire
    WeaponFireAttachmentBone="tip2"
    AltFireAttachmentBone="tip2"
    AmbientEffectEmitterClass=Class'DH_GapAltEmitter'
    CannonFireSound(0)=Sound'DH_UFO_snd.UFO.PortalBig'
    CannonFireSound(1)=Sound'DH_UFO_snd.UFO.PortalA'
    CannonFireSound(2)=Sound'DH_UFO_snd.UFO.PortalB'

    ShakeOffsetMag=(X=0.5,Y=0.0,Z=0.2)
    ShakeOffsetRate=(X=500.0,Y=500.0,Z=500.0)
    ShakeRotMag=(X=25.0,Y=0.0,Z=10.0)
    ShakeRotRate=(X=5000.0,Y=5000.0,Z=5000.0)

    AltFireSoundClass=Sound'DH_UFO_snd.UFO.portalloop'
    AltFireEndSound=Sound'DH_UFO_snd.UFO.UfoBigShot'

    ShootLoweredAnim="fire"
    ShootRaisedAnim="fire"

    // Coaxial MG ammo
    AltFireProjectileClass=Class'DH_GapStopSignBullet'
    InitialAltAmmo=12
    NumMGMags=1

    TracerProjectileClass=Class'DH_GapTrainSignBullet'
    TracerFrequency=1

    AltFireSoundScaling=1

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
