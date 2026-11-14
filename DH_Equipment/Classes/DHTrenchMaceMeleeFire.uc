//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHTrenchMaceMeleeFire extends DHTeardownMeleeFire;

defaultproperties
{
    DamageType=Class'DHTrenchMaceBashDamageType'
    DamageMin=70
    DamageMax=150
    TraceRange=120.0
    BashBackAnim="bash_pullback"
    BashHoldAnim="bash_hold"
    BashAnim="bash_attack"
    BashFinishAnim="bash_return"
    TearDownSound=SoundGroup'DH_WeaponSounds.shovel_hit'
    // TODO: These sounds got lost in a merge & need to be added back.
    // PlayerStabSound=SoundGroup'DH_WeaponSounds.ZombieBash'
    // PlayerBashSound=SoundGroup'DH_WeaponSounds.ZombieBash'
}
