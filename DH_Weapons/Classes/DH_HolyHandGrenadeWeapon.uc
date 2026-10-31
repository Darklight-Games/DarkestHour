//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_HolyHandGrenadeWeapon extends DHExplosiveWeapon;

defaultproperties
{
    ItemName="Holy Hand Grenade"
    NativeItemName="Holy Hand Grenade"
    FireModeClass(0)=Class'DH_HolyHandGrenadeFire'
    FireModeClass(1)=Class'DH_HolyHandGrenadeTossFire'
    AttachmentClass=Class'DH_HolyHandGrenadeAttachment'
    PickupClass=Class'DH_HolyHandGrenadePickup'

    Mesh=SkeletalMesh'DH_HHG_1st.HHG_1st'
    //HighDetailOverlay=Shader'Weapons1st_tex.f1grenade_s'
    bUseHighDetailOverlayIndex=false
    //HighDetailOverlayIndex=2

    FuzeLengthRange=(Min=7.0,Max=8.0)
    bHasReleaseLever=false
    //LeverReleaseSound=Sound'Inf_Weapons_Foley.f1_handle'
    //LeverReleaseVolume=1.0
    //LeverReleaseRadius=200.0
    DisplayFOV=80.0

    GroupOffset=0
}
