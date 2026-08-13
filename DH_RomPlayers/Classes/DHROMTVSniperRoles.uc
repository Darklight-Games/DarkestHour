//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVSniperRoles extends DHROMSniperRoles
    abstract;

defaultproperties
{
    PrimaryWeapons(0)=(Item=Class'DH_MN9130ScopedWeapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    SecondaryWeapons(0)=(Item=Class'DH_Nagant1895Weapon')

    SleeveTexture=Texture'DHSovietCharactersTex.DH_rus_sleeves'
    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'

}
