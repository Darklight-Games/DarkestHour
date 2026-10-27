//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476_M42Cannon extends DHVehicleCannon;

defaultproperties
{
    // Turret mesh
    Mesh=SkeletalMesh'DH_T34M42_anm.T34M42_TURRET_EXT'
    Skins(0)=Texture'DH_T34_76_M42_tex.T34M42_EXT'
    Skins(1)=Texture'DH_T34_76_M42_tex.T34M42_INT'
    bUseHighDetailOverlayIndex=false
    CollisionStaticMeshes(0)=(CollisionStaticMesh=StaticMesh'DH_T34M42_stc.T34M42_TURRET_COLLISION')

    bUseTankTurretRotation=true
    YawBone="GUN_YAW"
    PitchBone="GUN_PITCH"
    ShootAnim="SHOOT"
    ShootAnimBoneName="BARREL"
    GunnerAttachmentBone="GUN_YAW"

    // interior controls
    GunWheels(0)=(RotationType=ROTATION_Yaw,BoneName="YAW_WHEEL",Scale=-16.0,RotationAxis=AXIS_X)
    GunWheels(1)=(RotationType=ROTATION_Pitch,BoneName="PITCH_WHEEL",Scale=16.0,RotationAxis=AXIS_X)
    GunWheels(2)=(RotationType=ROTATION_Pitch,BoneName="PITCH_GEAR",Scale=16.0,RotationAxis=AXIS_Y)

    // Turret armor (model 1942)
    FrontArmorFactor=5.3
    LeftArmorFactor=5.3
    RightArmorFactor=5.3
    RearArmorFactor=5.3
    FrontArmorSlope=30.0
    LeftArmorSlope=25.0
    RightArmorSlope=25.0
    RearArmorSlope=20.0
    FrontLeftAngle=341.0
    FrontRightAngle=19.0
    RearRightAngle=162.0
    RearLeftAngle=198.0

    // Collision Attachments
    CollisionStaticMeshes(1)=(CollisionStaticMesh=StaticMesh'DH_T34M42_stc.T34M42_COM_HATCH_COLLISION',AttachBone="com_hatch")
    CollisionStaticMeshes(2)=(CollisionStaticMesh=StaticMesh'DH_T34M42_stc.T34M42_MANTLET_COLLISION',AttachBone="gun_pitch")

    // Turret movement
    ManualRotationsPerSecond=0.029
    PoweredRotationsPerSecond=0.0833 // 30 degrees/sec
    CustomPitchUpLimit=4550 // +25/-5 degrees
    CustomPitchDownLimit=64626

    // Cannon ammo
    PrimaryProjectileClass=Class'DH_T3476CannonShellSolid'
    SecondaryProjectileClass=Class'DH_T3476CannonShellHE'

    ProjectileDescriptions(0)="APBC"
    ProjectileDescriptions(1)="HE"
    
    nProjectileDescriptions(0)="BR-350BSP" // 1942 solid shell, after A and before the "proper" B
    nProjectileDescriptions(1)="OF-350"

    InitialPrimaryAmmo=25
    InitialSecondaryAmmo=25

    MaxPrimaryAmmo=27
    MaxSecondaryAmmo=50
    
    SecondarySpread=0.002

    // Coaxial MG ammo
    AltFireProjectileClass=Class'DH_DP27Bullet'
    InitialAltAmmo=63
    NumMGMags=15
    AltFireInterval=0.105
    TracerProjectileClass=Class'DH_DP27TracerBullet'
    TracerFrequency=5
    HudAltAmmoIcon=Texture'InterfaceArt_tex.dp27_ammo'

    // Weapon fire
    WeaponFireOffset=0
    AddedPitch=230
    AltFireAttachmentBone="MG_MUZZLE"
    AltFireOffset=(X=-8.0,Y=0.0,Z=0.0)

    // Sounds
    CannonFireSound(0)=Sound'Vehicle_Weapons.76mm_fire01'
    CannonFireSound(1)=Sound'Vehicle_Weapons.76mm_fire02'
    CannonFireSound(2)=Sound'Vehicle_Weapons.76mm_fire03'
    AltFireSoundClass=Sound'DH_WeaponSounds.dt_fire_loop'
    AltFireEndSound=Sound'DH_WeaponSounds.dt_fire_end'
    ReloadStages(0)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_01')
    ReloadStages(1)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_02')
    ReloadStages(2)=(Sound=Sound'DH_Vehicle_Reloads.reload_02s_03')
    ReloadStages(3)=(Sound=Sound'Vehicle_reloads.Pz_IV_F2_Reload_04')
    AltReloadStages(0)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty01_000',Duration=1.0)
    AltReloadStages(1)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty02_052',Duration=2.0,HUDProportion=0.65)
    AltReloadStages(2)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty03_098',Duration=2.0)
    AltReloadStages(3)=(Sound=Sound'Inf_Weapons_Foley.dp27_reloadempty04_158',Duration=0.5,HUDProportion=0.35)

    // Cannon range settings
    RangeSettings(0)=0
    RangeSettings(1)=200
    RangeSettings(2)=400
    RangeSettings(3)=600
    RangeSettings(4)=800
    RangeSettings(5)=1000
    RangeSettings(6)=1200
    RangeSettings(7)=1400
    RangeSettings(8)=1600
    RangeSettings(9)=1800
    RangeSettings(10)=2000
    RangeSettings(11)=2200
    RangeSettings(12)=2400
    RangeSettings(13)=2600
    RangeSettings(14)=2800
    RangeSettings(15)=3000
    RangeSettings(16)=3200
    RangeSettings(17)=3400
    RangeSettings(18)=3600
    RangeSettings(19)=3800
    RangeSettings(20)=4000
    RangeSettings(21)=4200
    RangeSettings(22)=4400
    RangeSettings(23)=4600
    RangeSettings(24)=4800
    RangeSettings(25)=5000
}