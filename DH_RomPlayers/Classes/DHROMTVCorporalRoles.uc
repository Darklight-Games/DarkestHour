//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVCorporalRoles extends DHROMCorporalRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_SVT40Weapon',AssociatedAttachment=Class'ROInventory.SVT40AmmoPouch')
    PrimaryWeapons(1)=(Item=Class'DH_PPSh41_StickWeapon',AssociatedAttachment=Class'ROInventory.ROPPS43AmmoPouch')
    PrimaryWeapons(2)=(Item=Class'DH_PPS43Weapon',AssociatedAttachment=Class'ROInventory.ROPPS43AmmoPouch')
    Grenades(0)=(Item=Class'DH_F1GrenadeWeapon')
    Grenades(1)=(Item=Class'DH_RDG1SmokeGrenadeWeapon')

    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'
}
