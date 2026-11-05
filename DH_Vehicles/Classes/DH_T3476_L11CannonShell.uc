//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_T3476_L11CannonShell extends DHSovietCannonShell;  //BR-350A

defaultproperties
{
    RoundType=RT_APBC
    Speed=36935.4 // 612 m/s
    MaxSpeed=36935.4
    ShellDiameter=7.62
    BallisticCoefficient=1.55 //TODO: pls, check
    bShatterProne=true

    //Damage
    ImpactDamage=720  //155 gramms TNT filler
    ShellImpactDamage=Class'DH_ShermanCannonShellDamageAP'
    HullFireChance=0.60
    EngineFireChance=0.89


    //Penetration
    DHPenetrationTable(0)=7.8  // 100m (changed for 612m/s from L11 short barrel gun)
    DHPenetrationTable(1)=7.3  // 250m
    DHPenetrationTable(2)=6.8  // 500m
    DHPenetrationTable(3)=6.6
    DHPenetrationTable(4)=6.2  // 1000m
    DHPenetrationTable(5)=5.9
    DHPenetrationTable(6)=5.6  // 1500m
    DHPenetrationTable(7)=5.2
    DHPenetrationTable(8)=5.0  // 2000m
    DHPenetrationTable(9)=4.3
    DHPenetrationTable(10)=3.9 // 3000m

    bOpticalAiming=true
    OpticalRanges(0)=(Range=0,RangeValue=0.380)
    OpticalRanges(1)=(Range=200,RangeValue=0.386)
    OpticalRanges(2)=(Range=400,RangeValue=0.393)
    OpticalRanges(3)=(Range=600,RangeValue=0.399)
    OpticalRanges(4)=(Range=800,RangeValue=0.407)
    OpticalRanges(5)=(Range=1000,RangeValue=0.415)
    OpticalRanges(6)=(Range=1200,RangeValue=0.424)
    OpticalRanges(7)=(Range=1400,RangeValue=0.434)
    OpticalRanges(8)=(Range=1600,RangeValue=0.447)
    OpticalRanges(9)=(Range=1800,RangeValue=0.460)
    OpticalRanges(10)=(Range=2000,RangeValue=0.472)
    OpticalRanges(11)=(Range=2200,RangeValue=0.486)
    OpticalRanges(12)=(Range=2400,RangeValue=0.501)
    OpticalRanges(13)=(Range=2600,RangeValue=0.518)
    OpticalRanges(14)=(Range=2800,RangeValue=0.535)
    OpticalRanges(15)=(Range=3000,RangeValue=0.551)
    OpticalRanges(16)=(Range=3200,RangeValue=0.570)
    OpticalRanges(17)=(Range=3400,RangeValue=0.590)
    OpticalRanges(18)=(Range=3600,RangeValue=0.610)
    OpticalRanges(19)=(Range=3800,RangeValue=0.629)
    OpticalRanges(20)=(Range=4000,RangeValue=0.650)
    OpticalRanges(21)=(Range=4200,RangeValue=0.670)
    OpticalRanges(22)=(Range=4400,RangeValue=0.690)
    OpticalRanges(23)=(Range=4600,RangeValue=0.710)
    OpticalRanges(24)=(Range=4800,RangeValue=0.731)
    OpticalRanges(25)=(Range=5000,RangeValue=0.752)
}
