//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVAntiTankRoles extends DHROMAntiTankRoles
    abstract;

defaultproperties
{
    PrimaryWeapons(0)=(Item=Class'DH_PTRDWeapon',AssociatedAttachment=Class'ROInventory.ROPPSh41AmmoPouch')
    PrimaryWeapons(1)=(Item=Class'DH_M44Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    PrimaryWeapons(2)=(Item=Class'DH_M38Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    SecondaryWeapons(0)=(Item=Class'DH_Nagant1895Weapon')
    SecondaryWeapons(1)=(Item=Class'DH_TT33Weapon')
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')
    Grenades(1)=(Item=Class'DH_RPG43GrenadeWeapon')
    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'

    GivenItems(1)=none //removing gl
}
