//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHShovelMeleeFire extends DHTeardownMeleeFire;

defaultproperties
{
    DamageType=Class'DHShovelBashDamageType'
    DamageMin=50
    DamageMax=90
    TraceRange=95.0
    BashBackAnim="bash_pullback"
    BashHoldAnim="bash_hold"
    BashAnim="bash_attack"
    BashFinishAnim="bash_return"
    TearDownSound=SoundGroup'DH_WeaponSounds.shovel_hit'
}
