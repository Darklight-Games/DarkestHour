//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476_M42Tank_Late extends DH_T3476_M42Tank;

defaultproperties
{
// vehicle properties
VehicleNameString="T-34-76 Mod.1942 Late"

// Vehicle weapon
PassengerWeapons(0)=(WeaponPawnClass=Class'DH_T3476_M42CannonPawn_Late')

// Skin
Skins(0)=Texture'DH_T34_76_M42_tex.T34M42_EXT_LATE'
CannonSkins(0)=Texture'DH_T34_76_M42_tex.T34M42_EXT_LATE'

// Attachments
RandomAttachmentGroups(0)=(Options=((Probability=0.7,Attachment=(StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_L',Offset=(X=-102,Y=-80.5,Z=83),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0)),AttachBone="body"))))
RandomAttachmentGroups(2)=(Options=((Probability=0.6,Attachment=(StaticMesh=StaticMesh'DH_T34_stc.T34_FUEL_TANK_LATE_R',Offset=(X=-102,Y=80.5,Z=83),SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0)),AttachBone="body")),(Probability=0.3,Attachment=(StaticMesh=StaticMesh'DH_T34_stc.T34_TARP',Offset=(X=-73,Y=73.8,Z=75),Rotation=(Pitch=7826,Yaw=-16380),AttachBone="body"))))
RandomAttachmentGroups(3)=(Options=((Probability=0.8,Attachment=(StaticMesh=StaticMesh'DH_T34_stc.T34_SPARE_TRACK',Offset=(X=153,Z=56.3),Rotation=(Pitch=-5606),AttachBone="body"))))

// Movement
EngineRestartFailChance=0.1 // mid-late war variant with better engine production quality
}