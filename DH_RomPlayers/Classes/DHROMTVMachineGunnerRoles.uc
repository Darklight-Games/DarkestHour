//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHROMTVMachineGunnerRoles extends DHROMMachineGunnerRoles
    abstract;

defaultproperties
{

    PrimaryWeapons(0)=(Item=Class'DH_DP27Weapon')
    PrimaryWeapons(1)=none
    SecondaryWeapons(0)=(Item=Class'DH_Nagant1895Weapon')
    SecondaryWeapons(1)=none

    Headgear(0)=Class'DH_SovietHelmet'
    GlovedHandTexture=Texture'DHSovietCharactersTex.hands_sovgloves'
}
