//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO
// Winter textures
// Hull/Turret inerior (mesh+textures)
// Driver/Commander/Turret animations
// Turret exterior mesh
// Interface spawn image
// interface top hull/turret images
// Sight/periscope pictures
// Destroyed static
// somehow figure out 6 o'clock gun limits. Should be -2 degree max due to barrel being too close to the engine deck

class DH_T3476_L11Tank extends DH_T3476Tank;

defaultproperties
{
    // vehicle properties
    VehicleNameString="T-34-76 L-11"
    ReinforcementCost=4

    // Vehicle passenger & weapons
    PassengerWeapons(0)=(WeaponPawnClass=Class'DH_T3476_L11CannonPawn')
    PassengerWeapons(1)=(WeaponPawnClass=Class'DH_T3476_L11MountedMGPawn')

    // Hull mesh
    Mesh=SkeletalMesh'DH_T3476_L11_anm.T3476_L11_BODY_EXT'
    Skins(0)=Texture'DH_T34_76_L11_tex.T3476_L11_EXT'
    Skins(1)=Texture'DH_T34_tex.T34_TRACK_EARLY'
    Skins(2)=Texture'DH_T34_tex.T34_TRACK_EARLY'
    // Skins(3)=Texture'DH_T34_85_tex.T34_85_INT'
    // DestroyedVehicleMesh=StaticMesh'DH_T34_85_stc.T34_85_DESTROYED'
    
    //Interface 
    VehicleHudImage=Texture'DH_T34_76_L11_tex.T3476_L11_BODY'
    VehicleHudTurret=TexRotator'DH_T34_76_L11_tex.T3476_L11_TURRET_rot'
    VehicleHudTurretLook=TexRotator'DH_T34_76_L11_tex.T3476_L11_TURRET_look'
    // SpawnOverlay(0)=Material'DH_InterfaceArt_tex.T34_76_L11'

    // Driver
    DriverPositions(0)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_INT',TransitionUpAnim="driver_hatch_open",DriverTransitionAnim="T34_DRIVER_HATCH_CLOSE",ViewPitchUpLimit=0,ViewPitchDownLimit=65535,ViewPositiveYawLimit=0,ViewNegativeYawLimit=0,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_INT',TransitionDownAnim="driver_hatch_close",DriverTransitionAnim="T34_DRIVER_HATCH_OPEN",ViewPitchUpLimit=5500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=11000,ViewNegativeYawLimit=-12500,bExposed=true)
    DrivePos=(Z=110.3)
    DriveRot=(Yaw=16384)
    DriveAnim="T34_DRIVER_CLOSE_IDLE"
    DriverAttachmentBone="BODY"
    UnbuttonedPositionIndex=1
    bLockCameraDuringTransition=true

    // Collision Attachments
    CollisionAttachments(0)=(StaticMesh=StaticMesh'DH_T3476_L11_stc.T3476_L11_DRIVER_HATCH_COLLISION',AttachBone="driver_hatch")
    
    // Attachments
    RandomAttachmentGroups(0)=(Options=((Probability=0.8,Attachment=(StaticMesh=StaticMesh'DH_T3476_L11_stc.T3476_L11_TOWING_CABLES',Offset=(Z=66.5),AttachBone="body"))))
    RandomAttachmentGroups(1)=(Options=((Probability=0.4,Attachment=(StaticMesh=StaticMesh'DH_T3476_L11_stc.T3476_L11_SEARCHLIGHT',SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0)),bAttachToWeapon=true,AttachBone="gun_pitch"))))
    RandomAttachmentGroups(2)=(Options=((Probability=0)))

    // Engine
    EngineRestartFailChance=0.25 //unreliability of early modification
}