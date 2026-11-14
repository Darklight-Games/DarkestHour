//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHBrokenBottleMeleeFire extends DHTeardownMeleeFire;

defaultproperties
{
    DamageType=Class'DHTrenchMaceBashDamageType'
    DamageMin=150
    DamageMax=300
    TraceRange=120.0
    BashBackAnim="bash_pullback_bottle"
    BashHoldAnim="bash_hold_bottle"
    BashAnim="bash_attack_bottle"
    BashFinishAnim="bash_return_bottle"
    //TearDownSound=SoundGroup'DH_WeaponSounds.shovel_hit'
    // TODO: These sounds got lost in a merge & need to be added back.
    // GroundBashSound=Sound'DH_WeaponSounds.BottleSmack'
    // GroundStabSound=Sound'DH_WeaponSounds.BottleSmack'
    // PlayerStabSound=Sound'DH_WeaponSounds.BottleStab'
    // PlayerBashSound=Sound'DH_WeaponSounds.BottleStab'
}
