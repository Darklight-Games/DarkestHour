//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVRadioOperatorRoles extends DHROMRadioOperatorRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_MN9130Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    PrimaryWeapons(1)=(Item=Class'DH_M38Weapon',AssociatedAttachment=Class'ROInventory.ROMN9130AmmoPouch')
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')
    GivenItems(0)="DH_Equipment.DHRadioItem"

    Backpacks(0)=(BackpackClass=Class'DH_SovRadioBackpack')
}
