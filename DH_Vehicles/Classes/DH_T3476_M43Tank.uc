//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO
// Add camo variants
// add hatches sounds
// add destroyed statics
// add GUI pictures

class DH_T3476_M43Tank extends DH_T3476Tank;

defaultproperties
{
    // vehicle properties
    VehicleNameString="T-34-76 Mod.1943"
    ReinforcementCost=4

    // Vehicle passenger & weapons
    PassengerWeapons(0)=(WeaponPawnClass=Class'DH_T3476_M43CannonPawn')
    PassengerWeapons(1)=(WeaponPawnClass=Class'DH_T3476_M42MountedMGPawn')

    // Hull mesh
    Mesh=SkeletalMesh'DH_T34M43_anm.T34M43_BODY_EXT'
    Skins(0)=Texture'DH_T34_76_M43_tex.T34M43_EXT'
    Skins(1)=Texture'DH_T34_tex.T34_TRACK'
    Skins(2)=Texture'DH_T34_tex.T34_TRACK'
    Skins(3)=Texture'DH_T34_76_M43_tex.T34M43_INT'
    DestroyedVehicleMesh=StaticMesh'DH_T34M43_stc.T34M43_DESTROYED'

    //Interface images 
    // VehicleHudImage=Texture'DH_T34_76_M42_tex.T34M42_body'
    // VehicleHudTurret=TexRotator'DH_T34_76_M42_tex.T34M42_turret_rot'
    // VehicleHudTurretLook=TexRotator'DH_T34_76_M42_tex.T34M42_turret_look'
    // SpawnOverlay(0)=Material'DH_InterfaceArt_tex.T34_85'

    // Driver
    DriverPositions(0)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34M43_anm.T34M43_BODY_INT',TransitionUpAnim="driver_hatch_open",DriverTransitionAnim="T34_DRIVER_HATCH_CLOSE",ViewPitchUpLimit=0,ViewPitchDownLimit=65535,ViewPositiveYawLimit=0,ViewNegativeYawLimit=0,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_T34M43_anm.T34M43_BODY_INT',TransitionDownAnim="driver_hatch_close",DriverTransitionAnim="T34_DRIVER_HATCH_OPEN",ViewPitchUpLimit=5500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=11000,ViewNegativeYawLimit=-12500,bExposed=true)

    // Collision Attachments
    CollisionAttachments(0)=(StaticMesh=StaticMesh'DH_T34_stc.T34_DRIVER_HATCH_COLLISION',AttachBone="driver_hatch")

    // Attachments
    RandomAttachmentGroups(0)=(Options=((Probability=0.8,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_L',Offset=(X=-110,Y=-75.5,Z=88.3),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    RandomAttachmentGroups(1)=(Options=((Probability=0.4,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_L',Offset=(X=-43,Y=-75.5,Z=88.3),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    RandomAttachmentGroups(2)=(Options=((Probability=0.8,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_R',Offset=(X=-110,Y=75.5,Z=88.3),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    RandomAttachmentGroups(3)=(Options=((Probability=0.3,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_TARP',Offset=(X=-15,Y=67.5,Z=80.2),Rotation=(Pitch=7826,Yaw=-16380))),(Probability=0.4,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_R',Offset=(X=-43,Y=75.5,Z=88.3),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    RandomAttachmentGroups(4)=(Options=((Probability=0.8,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_SPARE_TRACK',Offset=(X=153,Z=56.3),Rotation=(Pitch=-5606)))))
    RandomAttachmentGroups(5)=(Options=((Probability=0.9,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_TOWING_CABLES',Offset=(Z=52.3)))))

    // Damage
    // pros: diesel fuel
    // cons: cramped turret; fuel tanks in crew compartment
    // 4 men crew
    Health=500
    HealthMax=500
    EngineHealth=300
    EngineRestartFailChance=0.1 // mid-late war variant with better engine production quality
}
