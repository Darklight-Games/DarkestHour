//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVSergeantRoles extends DHROMSergeantRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_PPSh41_StickWeapon',AssociatedAttachment=Class'ROInventory.ROPPS43AmmoPouch')
    PrimaryWeapons(1)=(Item=Class'DH_PPS43Weapon',AssociatedAttachment=Class'ROInventory.ROPPS43AmmoPouch')
    PrimaryWeapons(2)=(Item=Class'DH_AVT40Weapon',AssociatedAttachment=Class'ROInventory.SVT40AmmoPouch')
    SecondaryWeapons(0)=(Item=Class'DH_TT33Weapon')
    SecondaryWeapons(1)=(Item=Class'DH_Nagant1895Weapon')
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')
    Grenades(1)=(Item=Class'DH_RDG1SmokeGrenadeWeapon')
    GivenItems(0)="DH_Equipment.DHBinocularsItemSoviet"

    SleeveTexture=Texture'DHSovietCharactersTex.DH_rus_sleeves'
    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'
}
