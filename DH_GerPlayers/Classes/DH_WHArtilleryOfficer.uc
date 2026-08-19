//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_WHArtilleryOfficer extends DHGESergeantRoles;

defaultproperties
{
    MyName="Artillery Officer"
    AltName="Artillerie Offizier"

    Grenades(0)=(Item=none)
    Grenades(1)=(Item=none)
    Grenades(2)=(Item=none)

    RolePawns(0)=(PawnClass=Class'DH_GermanArtilleryHeerPawn')
    Headgear(0)=Class'DH_HeerHelmetThree'
    Headgear(1)=Class'DH_HeerHelmetOne'
}
