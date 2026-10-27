//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476CannonPawn extends DHSovietCannonPawn;

defaultproperties
{
    GunClass=Class'DH_T3476Cannon'

    //Driver's positions and anims
    CameraBone="GUN_CAMERA"
    PeriscopeCameraBone="CAMERA_PERISCOPE"
    PlayerCameraBone="CAMERA_COM"

    GunsightPositions=1
    PeriscopePositionIndex=1
    UnbuttonedPositionIndex=3
    BinocPositionIndex=4

    //gunsight    
    DriverPositions(0)=(PositionMesh=SkeletalMesh'DH_T34_76_anm.T3476_TURRET_INT',ViewFOV=30.0,TransitionUpAnim="gunsight_out",bDrawOverlays=true)
    //periscope 
    DriverPositions(1)=(PositionMesh=SkeletalMesh'DH_T34_76_anm.T3476_TURRET_INT',ViewFOV=30.0,TransitionUpAnim="periscope_out",TransitionDownAnim="gunsight_in",ViewPitchUpLimit=5460,ViewPitchDownLimit=62790,ViewPositiveYawLimit=65536,ViewNegativeYawLimit=-65536,bDrawOverlays=true)
    //turret view
    DriverPositions(2)=(PositionMesh=SkeletalMesh'DH_T34_76_anm.T3476_TURRET_INT',ViewFOV=90.0,DriverTransitionAnim="T3476_COM_HATCH_CLOSE",TransitionUpAnim="com_hatch_open",TransitionDownAnim="periscope_in",ViewPitchUpLimit=5000,ViewPitchDownLimit=64500,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bDrawOverlays=false)
    //exposed
    DriverPositions(3)=(PositionMesh=SkeletalMesh'DH_T34_76_anm.T3476_TURRET_INT',DriverTransitionAnim="T3476_COM_HATCH_OPEN",TransitionDownAnim="com_hatch_close",ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bExposed=true)
    //binocs 
    DriverPositions(4)=(PositionMesh=SkeletalMesh'DH_T34_76_anm.T3476_TURRET_INT',ViewFOV=21.25,DriverTransitionAnim="T3476_COM_BINOCS",ViewPitchUpLimit=5000,ViewPitchDownLimit=59000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bDrawOverlays=true,bExposed=true)

    DrivePos=(X=-13,Y=-21,Z=8)
    DriveRot=(Yaw=16384)

    //Periscope
    PeriscopeOverlay=Texture'DH_VehicleOptics_tex.MG_sight' //emulating the PTK periscope 2.5x 26' FOV TODO: add PTK reticle
    PeriscopeSize=0.76

    DriveAnim="T3476_COM_IDLE_CLOSE"
    bLockCameraDuringTransition=false

    GunsightOverlay=Texture'DH_VehicleOptics_tex.T3476_sight_background' // edited RO sight to make edges solid black to avoid graphical smears on sides of sight
    CannonScopeCenter=Texture'Vehicle_Optic.T3476_sight_mover'
    GunsightSize=0.441 // 15 degrees visible FOV at 2.5x magnification (TMFD-7 sight)
    DestroyedGunsightOverlay=Texture'DH_VehicleOpticsDestroyed_tex.PZ4_sight_destroyed' // matches size of gunsight
    AmmoShellTexture=Texture'InterfaceArt_tex.T3476_SU76_Kv1shell'
    AmmoShellReloadTexture=Texture'InterfaceArt_tex.T3476_SU76_Kv1shell_reload'
    PoweredRotateSound=Sound'Vehicle_Weapons.hydraul_turret_traverse'
    PoweredPitchSound=Sound'Vehicle_Weapons.manual_turret_elevate'
    PoweredRotateAndPitchSound=Sound'Vehicle_Weapons.hydraul_turret_traverse'
}
