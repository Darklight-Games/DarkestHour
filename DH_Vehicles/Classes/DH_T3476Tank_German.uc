//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476Tank_German extends DH_T3476Tank;

defaultproperties
{
    VehicleNameString="Pz.Kpfw.747(r)"
    VehicleTeam=0

    Skins(0)=Texture'DH_T34_76_tex.T3476_EXT_GER'
    CannonSkins(0)=Texture'DH_T34_76_tex.T3476_EXT_GER'
    
    RandomAttachmentGroups(2)=(Options=((Probability=0.75,Attachment=(StaticMesh=StaticMesh'DH_T34_76_stc.T34_GERMAN_FLAG',bAttachToWeapon=true,AttachBone="com_hatch"))))
}