//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_HolyHandGrenadeProjectile extends DHGrenadeProjectile;

var() sound PreExplosionSound; // 
var int TimerStep;            // Tracks what stage the fuse is currently in

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    
    // Step 0: Initialize tracking variables
    TimerStep = 0;
    
    // Step 1: Start the first countdown phase (7 seconds for the sound)
    SetTimer(7.0, false); 
}

simulated function Timer()
{
    // Phase 1: timer has fired
    if (TimerStep == 0)
    {
        // Play the sound attached directly to this grenade actor
        if (PreExplosionSound != none)
        {
            PlaySound(PreExplosionSound, SLOT_None, 2.0,, 800.0,, true);
        }
        
        // Advance to Phase 2
        TimerStep = 1;
        
        // Start the secondary countdown phase (2 second until explosion)
        SetTimer(2.0, false);
    }
    // Phase 2: The final 1-second timer has fired
    else if (TimerStep == 1)
    {
        // Trigger the standard Red Orchestra / Darkest Hour explosion routine
        Explode(Location, vect(0,0,1));
    }
}

// TO DO: reduced damage to allies!

defaultproperties
{
    Damage=660.0 // 
    DamageRadius=1000 // about 15 meters
    MyDamageType=Class'DH_HolyHandGrenadeDamType'
    StaticMesh=StaticMesh'DH_HHG_stc.HHG.HHG'
    ExplosionSound(0)=Sound'DH_HHG_snd.HHG.Explosion2'
    ExplosionSound(1)=Sound'DH_HHG_snd.HHG.Explosion2'
    ExplosionSound(2)=Sound'DH_HHG_snd.HHG.Explosion2'
    //SpoonProjectileClass=Class'DH_F1GrenadeSpoonProjectile'

    PreExplosionSound=Sound'DH_HHG_snd.HHG.HOLYGRENADE'
    bTimerLoop=False

    ImpactSound=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
    ImpactSoundDirt=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
    ImpactSoundWood=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
    ImpactSoundMetal=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
    ImpactSoundMud=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
    ImpactSoundGrass=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
    ImpactSoundConcrete=Sound'DH_HHG_snd.HHG.HOLYGRENADEIMPACT'
}
