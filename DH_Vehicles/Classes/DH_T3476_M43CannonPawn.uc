//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476_M43CannonPawn extends DHSovietCannonPawn;

defaultproperties
{
    //Gun Class
    GunClass=Class'DH_T3476_M43Cannon'

    //Driver's positions and anims

    // gunsight
    DriverPositions(0)=(PositionMesh=SkeletalMesh'DH_T34M43_anm.T34M43_TURRET_INT',ViewFOV=30.0,bDrawOverlays=true)
    // periscope
    DriverPositions(1)=(PositionMesh=SkeletalMesh'DH_T34M43_anm.T34M43_TURRET_INT',ViewFOV=75.0,DriverTransitionAnim="T34M43_COM_HATCH_CLOSE",TransitionUpAnim="com_hatch_open",ViewPitchUpLimit=2731,ViewPitchDownLimit=64080,ViewPositiveYawLimit=65536,ViewNegativeYawLimit=-65536,bDrawOverlays=true)
    // exposed
    DriverPositions(2)=(PositionMesh=SkeletalMesh'DH_T34M43_anm.T34M43_TURRET_INT',DriverTransitionAnim="T34M43_COM_HATCH_OPEN",TransitionDownAnim="com_hatch_close",ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bExposed=true)
    // binocs
    DriverPositions(3)=(PositionMesh=SkeletalMesh'DH_T34M43_anm.T34M43_TURRET_INT',ViewFOV=21.25,DriverTransitionAnim="T34M43_COM_BINOCS",ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bDrawOverlays=true,bExposed=true)


    GunsightPositions=1
    PeriscopePositionIndex=1
    PeriscopeCameraBone="CAMERA_PERISCOPE"
    UnbuttonedPositionIndex=2
    BinocPositionIndex=3
    DrivePos=(Z=58)
    DriveRot=(Yaw=16384)
    PlayerCameraBone="CAMERA_COM"

    DriveAnim="T34M43_COM_IDLE_CLOSE"
    bLockCameraDuringTransition=false

    //Gunsight
    CameraBone="GUNSIGHT_CAMERA"
    GunsightOverlay=Texture'DH_VehicleOptics_tex.T3476_sight_background' // edited RO sight to make edges solid black to avoid graphical smears on sides of sight
    CannonScopeCenter=Texture'Vehicle_Optic.T3476_sight_mover'
    GunsightSize=0.5 // 15 degrees visible FOV at 2.5x magnification (TMFD-7 sight)
    DestroyedGunsightOverlay=Texture'DH_VehicleOpticsDestroyed_tex.PZ4_sight_destroyed' // matches size of gunsight

    //HUD
    AmmoShellTexture=Texture'InterfaceArt_tex.T3476_SU76_Kv1shell'
    AmmoShellReloadTexture=Texture'InterfaceArt_tex.T3476_SU76_Kv1shell_reload'

    //Sounds
    PoweredRotateSound=Sound'Vehicle_Weapons.hydraul_turret_traverse'
    PoweredPitchSound=Sound'Vehicle_Weapons.manual_turret_elevate'
    PoweredRotateAndPitchSound=Sound'Vehicle_Weapons.hydraul_turret_traverse'
}