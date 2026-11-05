//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476Tank_GermanSnow extends DH_T3476Tank;

defaultproperties
{
    VehicleNameString="Pz.Kpfw.747(r)"
    VehicleTeam=0
    
    Skins(0)=Texture'DH_T34_76_tex.T3476_EXT_GER_WINTER'
    Skins(1)=Texture'DH_T34_tex.T34_TRACK_EARLY_WINTER'
    Skins(2)=Texture'DH_T34_tex.T34_TRACK_EARLY_WINTER'
    CannonSkins(0)=Texture'DH_T34_76_tex.T3476_EXT_GER_WINTER'
    
    RandomAttachmentGroups(2)=(Options=((Probability=0.3,Attachment=(StaticMesh=StaticMesh'DH_T34_76_stc.T34_GERMAN_FLAG',bAttachToWeapon=true,AttachBone="com_hatch"))))
}