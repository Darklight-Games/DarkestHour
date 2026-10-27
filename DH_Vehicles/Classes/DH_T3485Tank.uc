//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO 
// Fix turret attachments
// Figure out driver controlled smoke system (or maybe it was controlled by commander?)
// Fix GUI pictures
// Add hatch sounds

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

    // Driver
    UnbuttonedPositionIndex=1
    DriverPositions(0)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_INT',TransitionUpAnim="driver_hatch_open",DriverTransitionAnim="T34_DRIVER_HATCH_CLOSE",ViewPitchUpLimit=0,ViewPitchDownLimit=65535,ViewPositiveYawLimit=0,ViewNegativeYawLimit=0,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34_85_anm.T34_85_BODY_INT',TransitionDownAnim="driver_hatch_close",DriverTransitionAnim="T34_DRIVER_HATCH_OPEN",ViewPitchUpLimit=5500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=11000,ViewNegativeYawLimit=-12500,bExposed=true)
    DrivePos=(Z=110.3)
    DriveRot=(Yaw=16384)
    DriveAnim="T34_DRIVER_CLOSE_IDLE"
    DriverAttachmentBone="BODY"
    bLockCameraDuringTransition=true

    // Collision Attachments
    CollisionAttachments(0)=(StaticMesh=StaticMesh'DH_T34_stc.T34_DRIVER_HATCH_COLLISION',AttachBone="driver_hatch")

    // Attachments
    RandomAttachmentGroups(0)=(Options=((Probability=0.8,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_SPARE_TRACK',Offset=(X=153,Z=56.3),Rotation=(Pitch=-5606)))))
    RandomAttachmentGroups(1)=(Options=((Probability=0.9,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_TOWING_CABLES',Offset=(Z=52.3)))))
    RandomAttachmentGroups(2)=(Options=((Probability=0.7,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_L',Offset=(X=-104,Y=-75.3,Z=88.5),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    RandomAttachmentGroups(3)=(Options=((Probability=0.7,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_R',Offset=(X=-104,Y=75.3,Z=88.5),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    RandomAttachmentGroups(4)=(Options=((Probability=0.85,Attachment=(AttachBone="gun_yaw",bAttachToWeapon=true,AttachBone="gun_yaw",StaticMesh=StaticMesh'DH_T34_stc.T34_TARP'))))
    
    // Damage
    // pros: diesel fuel; 5 men crew
    // cons: fuel tanks in crew compartment
    Health=525
    HealthMax=525
    EngineHealth=300
    EngineRestartFailChance=0.1 // mid-late war variant with better engine production quality
}
