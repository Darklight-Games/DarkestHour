//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476_M42Cannon_Late extends DH_T3476_M42Cannon;

defaultproperties
{
    // Cannon ammo
    nProjectileDescriptions(0)="BR-350B" // standard mid-late war APBC shell
    nProjectileDescriptions(1)="OF-350"

    TertiaryProjectileClass=Class'DH_T3476CannonShellAPCR'
    InitialTertiaryAmmo=4
    MaxTertiaryAmmo=6
    nProjectileDescriptions(2)="BR-350P"
    ProjectileDescriptions(2)="APCR"
}
