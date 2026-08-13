//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_ROMTV_StandardCorporal extends DHROMTVCorporalRoles;

defaultproperties
{
    RolePawns(0)=(PawnClass=Class'DH_RomanianTVSovTunicCorporalPawn',Weight=7.0)
    Headgear(0)=Class'DH_SovietHelmet'
    Headgear(1)=Class'DH_RomanianHelmet'

    HeadgearProbabilities(0)=0.7
    HeadgearProbabilities(1)=0.3

}
