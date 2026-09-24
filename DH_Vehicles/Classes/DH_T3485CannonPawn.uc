//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3485CannonPawn extends DHSovietCannonPawn;

defaultproperties
{
    GunClass=Class'DH_T3485Cannon'

    CameraBone="GUNSIGHT_CAMERA"
    PeriscopeCameraBone="CAMERA_PERISCOPE"
    PlayerCameraBone="CAMERA_COM"

    // gunsight
    DriverPositions(0)=(PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_TURRET_INT',ViewFOV=21.25,bDrawOverlays=true)
    // periscope
    DriverPositions(1)=(PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_TURRET_INT',ViewFOV=75.0,DriverTransitionAnim="T34_85_COM_HATCH_CLOSE",TransitionUpAnim="com_hatch_open",ViewPitchUpLimit=2731,ViewPitchDownLimit=64080,ViewPositiveYawLimit=65536,ViewNegativeYawLimit=-65536,bDrawOverlays=true)
    // exposed
    DriverPositions(2)=(PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_TURRET_INT',DriverTransitionAnim="T34_85_COM_HATCH_OPEN",TransitionDownAnim="com_hatch_close",ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bExposed=true)
    // binocs
    DriverPositions(3)=(PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_TURRET_INT',ViewFOV=21.25,DriverTransitionAnim="T34_85_COM_BINOCS",ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bDrawOverlays=true,bExposed=true)

    GunsightPositions=1
    PeriscopePositionIndex=1
    BinocPositionIndex=3
    DrivePos=(Z=58)
    DriveAnim="T34_85_IDLE_CLOSE"
    //PeriscopeSize=0.5
    

    GunsightOverlay=Texture'Vehicle_Optic.t3485_sight'
    GunsightSize=0.753 // 16 degrees visible FOV at 4x magnification (TSh-16 sight)
    OverlayCorrectionY=-2.5 // raises sight slightly so tip of reticle arrowhead is right on the aim point
    CannonScopeCenter=Texture'Vehicle_Optic.T3476_sight_mover'
    ScopeCenterPositionX=0.075
    ScopeCenterScaleX=2.0
    ScopeCenterScaleY=1.0
    DestroyedGunsightOverlay=Texture'DH_VehicleOpticsDestroyed_tex.PZ4_sight_destroyed' // matches size of gunsight

    AmmoShellTexture=Texture'InterfaceArt_tex.T3485shell'
    AmmoShellReloadTexture=Texture'InterfaceArt_tex.T3485shell_reload'

    PoweredRotateSound=Sound'Vehicle_Weapons.hydraul_turret_traverse'
    PoweredPitchSound=Sound'Vehicle_Weapons.manual_turret_elevate'
    PoweredRotateAndPitchSound=Sound'Vehicle_Weapons.hydraul_turret_traverse'
}
