//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO
// attachments
// smokes

class DH_T3485Tank extends DH_T3476Tank;

defaultproperties
{
    // vehicle properties
    VehicleNameString="T-34-85"
    ReinforcementCost=6

    // Vehicle passenger & weapons
    PassengerWeapons(0)=(WeaponPawnClass=Class'DH_T3485CannonPawn')
    PassengerWeapons(1)=(WeaponPawnClass=Class'DH_T3485MountedMGPawn')

    // Hull mesh
    Mesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_EXT'
    Skins(0)=Texture'DH_T34_85_tex.T34_85_EXT'
    Skins(1)=Texture'DH_T34_tex.T34_TRACK'
    Skins(2)=Texture'DH_T34_tex.T34_TRACK'
    Skins(3)=Texture'DH_T34_85_tex.T34_85_INT'
    DestroyedVehicleMesh=StaticMesh'DH_T34_85_stc.T34_85_DESTROYED'
    VehicleHudTurret=TexRotator'DH_InterfaceArt_tex.t34_85_turret_rot'
    VehicleHudTurretLook=TexRotator'DH_InterfaceArt_tex.t34_85_turret_look'
    SpawnOverlay(0)=Material'DH_InterfaceArt_tex.T34_85'

    // Periscope
    PeriscopePositionIndex=0
    PeriscopeCameraBone="DRIVER_PERISCOPE"

    // Driver
    DriverPositions(0)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_INT',TransitionUpAnim="driver_hatch_open",DriverTransitionAnim="T34_DRIVER_HATCH_CLOSE",ViewPitchUpLimit=0,ViewPitchDownLimit=65535,ViewPositiveYawLimit=0,ViewNegativeYawLimit=0,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_INT',TransitionDownAnim="driver_hatch_close",DriverTransitionAnim="T34_DRIVER_HATCH_OPEN",ViewPitchUpLimit=5500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=11000,ViewNegativeYawLimit=-12500,bExposed=true)
    DrivePos=(Z=58)
    DriveRot=(Yaw=16384)
    DriveAnim="T34_DRIVER_CLOSE_IDLE"
    DriverAttachmentBone="BODY"
    UnbuttonedPositionIndex=1
    bLockCameraDuringTransition=true

    // Collision Attachments
    CollisionAttachments(0)=(StaticMesh=StaticMesh'DH_T34_stc.T34_DRIVER_HATCH_COLLISION',AttachBone="driver_hatch")
    
    // Visual effects
    TreadVelocityScale=175.0
    WheelRotationScale=50000.0

    // Shadow
    ShadowZOffset=50.0

    // Damage
    // pros: diesel fuel; 5 men crew
    // cons: fuel tanks in crew compartment
    Health=525
    HealthMax=525
    EngineHealth=300

    // Destroyed Treads
    DamagedTrackStaticMeshLeft=StaticMesh'DH_T34_stc.T34_TRACK_DAMAGED_L'
    DamagedTrackStaticMeshRight=StaticMesh'DH_T34_stc.T34_TRACK_DAMAGED_R'

    PlayerFireDamagePer2Secs=12.0 // reduced from 15 for all diesels
    FireDetonationChance=0.045  //reduced from 0.07 for all diesels
    DisintegrationHealth=-1200.0 //diesel
    AmmoIgnitionProbability=0.8 // 0.75 default
}
