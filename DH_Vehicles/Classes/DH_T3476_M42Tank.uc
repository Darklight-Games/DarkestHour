//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO
// Turret animations
// Add turret exterior & interior meshes
// Add camo variants
// Interface spawn image
// interface top hull/turret images
// Fix Sight picture and add periscope reticle
// add smokes (same as for 85)
// add riders

class DH_T3476_M42Tank extends DH_T3476Tank;

defaultproperties
{
    // vehicle properties
    VehicleNameString="T-34-76 Mod.1942"
    ReinforcementCost=4

    // Vehicle passenger & weapons
    // PassengerWeapons(0)=(WeaponPawnClass=Class'DH_T3485CannonPawn')
    PassengerWeapons(1)=(WeaponPawnClass=Class'DH_T3476_M42MountedMGPawn')

    // Hull mesh
    Mesh=SkeletalMesh'DH_T34M42_anm.T34M42_BODY_EXT'
    Skins(0)=Texture'DH_T34_3_tex.T34M42_EXT'
    Skins(1)=Texture'DH_T34_tex.T34_TRACK'
    Skins(2)=Texture'DH_T34_tex.T34_TRACK'
    Skins(3)=Texture'DH_T34_3_tex.T34M42_INT'
    DestroyedVehicleMesh=StaticMesh'DH_T34M42_stc.T34M42_DESTROYED'
    // VehicleHudTurret=TexRotator'DH_InterfaceArt_tex.t34_85_turret_rot'
    // VehicleHudTurretLook=TexRotator'DH_InterfaceArt_tex.t34_85_turret_look'
    // SpawnOverlay(0)=Material'DH_InterfaceArt_tex.T34_85'

    // Periscope
    PeriscopePositionIndex=0
    PeriscopeCameraBone="DRIVER_PERISCOPE"

    // Driver
    DriverPositions(0)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34M42_anm.T34M42_BODY_INT',TransitionUpAnim="driver_hatch_open",DriverTransitionAnim="T34_DRIVER_HATCH_CLOSE",ViewPitchUpLimit=0,ViewPitchDownLimit=65535,ViewPositiveYawLimit=0,ViewNegativeYawLimit=0,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34M42_anm.T34M42_BODY_INT',TransitionDownAnim="driver_hatch_close",DriverTransitionAnim="T34_DRIVER_HATCH_OPEN",ViewPitchUpLimit=5500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=11000,ViewNegativeYawLimit=-12500,bExposed=true)
    DrivePos=(Z=110.3)
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

    // Attachments
    RandomAttachmentGroups(0)=(Options=((Probability=0.6,Attachment=(StaticMesh=StaticMesh'DH_T34M42_stc.T34M42_FUEL_TANKS',AttachBone="body"))))
    RandomAttachmentGroups(1)=(Options=((Probability=0.9,Attachment=(StaticMesh=StaticMesh'DH_T34_stc.T34_TOWING_CABLES',Offset=(Z=52.3),AttachBone="body"))))
    RandomAttachmentGroups(2)=(Options=((Probability=0.8,Attachment=(StaticMesh=StaticMesh'DH_T34_stc.T34_TARP',Offset=(X=-73,Y=73.8,Z=75),Rotation=(Pitch=7826,Yaw=-16380),AttachBone="body"))))
    
    // Shadow
    ShadowZOffset=20.0

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
