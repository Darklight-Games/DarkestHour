//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_ParasolFire extends DHRocketFire;

defaultproperties
{
    ProjectileClass=Class'DH_GapTrainBullet'
    AmmoClass=Class'DH_ParasolAmmo'
    bCausesExhaustDamage=false
    //ExhaustDamageType=none
    //ExhaustLength=1
    MaxVerticalRecoilAngle=11
    MaxHorizontalRecoilAngle=1
    FireSounds(0)=Sound'DH_UFO_snd.UFO.PortalBig'
    FireSounds(1)=Sound'DH_UFO_snd.UFO.PortalBig'
    FireSounds(2)=Sound'DH_UFO_snd.UFO.PortalBig'
    //FireAnim="shoot"
    FireAnim="shoothip"
    MuzzleBone="Warhead"
    AimError=1200.0
    Spread=550.0
}
