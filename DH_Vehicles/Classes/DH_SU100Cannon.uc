//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_SU100Cannon extends DHVehicleCannon;

defaultproperties
{
    // Turret mesh
    Mesh=SkeletalMesh'DH_SU100_anm.SU100_TURRET_EXT'
    Skins(0)=Texture'DH_SU100_tex.SU100_EXT'
    // Skins(1)=Texture'DH_T34_85_tex.T34_85_INT'

    // Collision Attachments
    CollisionStaticMeshes(1)=(CollisionStaticMesh=StaticMesh'DH_T34_85_stc.T34_85_COM_HATCH_COLLISION',AttachBone="com_hatch")
    CollisionStaticMeshes(0)=(CollisionStaticMesh=StaticMesh'DH_SU100_stc.SU100_MANTLET_COLLISION',AttachBone="gun_pitch")

    // AnimationDrivers(0)=(Channel=2,BoneName="GUN_PITCH",AnimationName="PITCH_DRIVER",AnimationFrameCount=25,RotationType=ROTATION_Pitch)

    // Armor
    GunMantletArmorFactor=1.0

    // Turret movement
    bHasTurret=false
    bLimitYaw=true
    YawBone="GUN_YAW"
    PitchBone="GUN_PITCH"
    ShootAnim="SHOOT"
    ShootAnimBoneName="BARREL"
    GunnerAttachmentBone="TURRET"
    
    ManualRotationsPerSecond=0.02

    MaxPositiveYaw=1820 // +10/-10 degrees
    MaxNegativeYaw=-1820
    
    YawStartConstraint=-3000.0
    YawEndConstraint=3000.0

    CustomPitchUpLimit=3640 // +20/-3 degrees
    CustomPitchDownLimit=64974

    // Cannon ammo
    PrimaryProjectileClass=Class'DH_T3485CannonShell_Early'
    SecondaryProjectileClass=Class'DH_T3485CannonShellAPCR'
    TertiaryProjectileClass=Class'DH_T3485CannonShellHE'

    ProjectileDescriptions(0)="APBC"
    ProjectileDescriptions(1)="APCR"
    ProjectileDescriptions(2)="HE"

    nProjectileDescriptions(0)="BR-365"
    nProjectileDescriptions(1)="BR-365P"
    nProjectileDescriptions(2)="O-365"

    InitialPrimaryAmmo=28
    InitialSecondaryAmmo=4
    InitialTertiaryAmmo=16
    MaxPrimaryAmmo=30
    MaxSecondaryAmmo=6
    MaxTertiaryAmmo=25
    SecondarySpread=0.001
    TertiarySpread=0.002

    // Sounds
    CannonFireSound(0)=Sound'Vehicle_Weapons.85mm_fire01'
    CannonFireSound(1)=Sound'Vehicle_Weapons.85mm_fire02'
    CannonFireSound(2)=Sound'Vehicle_Weapons.85mm_fire03'
    AltFireSoundClass=Sound'DH_WeaponSounds.dt_fire_loop'
    AltFireEndSound=Sound'DH_WeaponSounds.dt_fire_end'
    ReloadStages(0)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_01')
    ReloadStages(1)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_02')
    ReloadStages(2)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_03')
    ReloadStages(3)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_04')
    AltReloadStages(0)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty01_000',Duration=1.0)
    AltReloadStages(1)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty02_052',Duration=2.0,HUDProportion=0.65)
    AltReloadStages(2)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty03_098',Duration=2.0)
    AltReloadStages(3)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty04_158',Duration=0.5,HUDProportion=0.35)

    // Cannon range settings
    RangeSettings(0)=0
    RangeSettings(1)=400
    RangeSettings(2)=500
    RangeSettings(3)=600
    RangeSettings(4)=700
    RangeSettings(5)=800
    RangeSettings(6)=900
    RangeSettings(7)=1000
    RangeSettings(8)=1200
    RangeSettings(9)=1400
    RangeSettings(10)=1600
    RangeSettings(11)=1800
    RangeSettings(12)=2000
    RangeSettings(13)=2200
    RangeSettings(14)=2400
    RangeSettings(15)=2600
    RangeSettings(16)=2800
    RangeSettings(17)=3000
    RangeSettings(18)=3200
    RangeSettings(19)=3400
    RangeSettings(20)=3600
    RangeSettings(21)=3800
}
