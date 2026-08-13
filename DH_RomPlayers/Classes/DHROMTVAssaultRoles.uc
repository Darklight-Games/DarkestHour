//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVAssaultRoles extends DHROMAssaultRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_PPSH41Weapon',AssociatedAttachment=Class'ROInventory.ROPPSh41AmmoPouch')
    PrimaryWeapons(1)=none
    PrimaryWeapons(2)=none
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')

    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'
    GivenItems(0)="DH_Equipment.DHShovelItem_Russian"
}
