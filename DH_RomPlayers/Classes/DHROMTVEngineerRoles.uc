//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVEngineerRoles extends DHROMEngineerRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_MN9130Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    PrimaryWeapons(1)=(Item=Class'DH_M38Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    PrimaryWeapons(2)=(Item=Class'DH_M44Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    SecondaryWeapons(0)=none
    SecondaryWeapons(1)=none
    SecondaryWeapons(2)=none
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')
    Grenades(1)=(Item=Class'DH_RDG1SmokeGrenadeWeapon')
    Grenades(2)=(Item=Class'DH_RPG43GrenadeWeapon')
    GivenItems(0)="DH_Weapons.DH_SatchelCharge10lb10sWeapon"  //to do: RPG-40
    GivenItems(1)="DH_Equipment.DHWireCuttersItem"
    GivenItems(2)="DH_Equipment.DHShovelItem_Russian"

    SleeveTexture=Texture'DHSovietCharactersTex.DH_rus_sleeves'
    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'

}
