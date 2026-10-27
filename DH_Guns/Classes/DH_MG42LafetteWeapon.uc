//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_MG42LafetteWeapon extends DHMountedWeapon;

defaultproperties
{
    ItemName="Maschinengewehr 42 (Lafette)"
    ConstructionClass=Class'DH_MG42LafetteGunConstruction'
    AttachmentClass=Class'DH_MG42LafetteAttachment'
    PickupClass=Class'DH_MG42LafettePickup'
    Mesh=SkeletalMesh'DH_M2Mortar_anm.M2MORTAR_WEAPON'      // TODO: replace
    bIsEncumbering=false
}
