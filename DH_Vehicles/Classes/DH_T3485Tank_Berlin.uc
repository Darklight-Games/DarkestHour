//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3485Tank_Berlin extends DH_T3485Tank;

defaultproperties
{
    Skins(0)=Texture'DH_T34_85_tex.T34_85_EXT_BERLIN'
    CannonSkins(0)=Texture'DH_T34_85_tex.T34_85_EXT_BERLIN'
    PassengerWeapons(0)=(WeaponPawnClass=Class'DH_T3485CannonPawn_Berlin')

    RandomAttachmentGroups(2)=(Options=((Probability=0.7,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_BODY_CAGE_LR',Offset=(Z=57.3),AttachBone="body")),(Probability=0.2,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_FUEL_TANK_L',AttachBone="body"))))
    RandomAttachmentGroups(3)=(Options=((Probability=0.7,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_BODY_CAGE_RR',Offset=(Z=57.3),AttachBone="body")),(Probability=0.2,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_FUEL_TANK_R',AttachBone="body"))))
    RandomAttachmentGroups(4)=(Options=((Probability=0.95,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_TURRET_CAGE_CR',bAttachToWeapon=true,AttachBone="gun_yaw")))) 
    RandomAttachmentGroups(5)=(Options=((Probability=0.95,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_BODY_CAGE_LF',Offset=(Z=57.3),AttachBone="body"))))
    RandomAttachmentGroups(6)=(Options=((Probability=0.95,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_BODY_CAGE_RF',Offset=(Z=57.3),AttachBone="body"))))
    RandomAttachmentGroups(7)=(Options=((Probability=0.95,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_BODY_CAGE_CR',Offset=(Z=57.3),AttachBone="body"))))
    RandomAttachmentGroups(8)=(Options=((Probability=0.9,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_TURRET_CAGE_CF',bAttachToWeapon=true,AttachBone="gun_yaw"))))
    RandomAttachmentGroups(9)=(Options=((Probability=0.9,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_TURRET_CAGE_LF',bAttachToWeapon=true,AttachBone="gun_yaw"))))
    RandomAttachmentGroups(10)=(Options=((Probability=0.9,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_TURRET_CAGE_RF',bAttachToWeapon=true,AttachBone="gun_yaw"))))
    RandomAttachmentGroups(11)=(Options=((Probability=0.9,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_TURRET_CAGE_LR',bAttachToWeapon=true,AttachBone="gun_yaw"))))
    RandomAttachmentGroups(12)=(Options=((Probability=0.9,Attachment=(StaticMesh=StaticMesh'DH_T34_85_stc.T34_85_TURRET_CAGE_RR',bAttachToWeapon=true,AttachBone="gun_yaw"))))
    // RandomAttachmentGroups(13)=
}
