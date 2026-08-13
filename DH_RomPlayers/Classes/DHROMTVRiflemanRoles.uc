//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVRiflemanRoles extends DHROMRiflemanRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_MN9130Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    PrimaryWeapons(1)=(Item=Class'DH_M44Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    PrimaryWeapons(2)=none
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')

    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'
}
