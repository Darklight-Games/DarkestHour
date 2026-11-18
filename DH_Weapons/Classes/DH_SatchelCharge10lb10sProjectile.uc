//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_SatchelCharge10lb10sProjectile extends DHThrowableExplosiveProjectile; // incorporating SatchelCharge10lb10sProjectile & ROSatchelChargeProjectile

const UNDER_VEHICLE_TRACE_HEIGHT = 64.0;

var float           UnderVehicleDamageBonus;  // Extra damage applied on top of normal damage if explosive is under a vehicle

var float           ConstructionDamageRadius;   // A radius that will damage Contructions
var float           ConstructionDamageMax;

var float           ObstacleDamageRadius;       // A radius that will damage Obstacles
var float           ObstacleDamageMax;

var float           EngineDamageMassThreshold;  // A mass threshold at which a vehicle will take min damage instead of setting the engine on fire
var float           EngineDamageRadius;         // A radius that will damage Vehicle Engines
var float           EngineDamageMax;

var float           TreadDamageMassThreshold;   // A mass threshold at which a vehicle will take min damage instead of destroying the tread outright
var float           TreadDamageRadius;          // A radius that will damage Vehicle Treads
var float           TreadDamageMax;

// Modified to record SavedInstigator & SavedPRI
// RODemolitionChargePlacedMsg from ROSatchelChargeProjectile is omitted
simulated function PostBeginPlay()
{
    super.PostBeginPlay();

    if (Instigator != none)
    {
        SavedInstigator = Instigator;
        SavedPRI = Instigator.PlayerReplicationInfo;
    }
}

// Modified to check whether satchel blew up in a special Volume that needs to be triggered
simulated function BlowUp(Vector HitLocation)
{
    if (Instigator != none)
    {
        SavedInstigator = Instigator;
        SavedPRI = Instigator.PlayerReplicationInfo;
    }

    if (Role == ROLE_Authority)
    {
        DelayedHurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
        HandleObjSatchels();
        HandleVehicles();
        HandleObstacles();
        HandleConstructions();
        MakeNoise(1.0);
    }
}

function HandleObjSatchels()
{
    local DH_ObjSatchel SatchelObjActor;
    local Volume        V;

    foreach TouchingActors(Class'Volume', V)
    {
        if (DH_ObjSatchel(V.AssociatedActor) != none)
        {
            SatchelObjActor = DH_ObjSatchel(V.AssociatedActor);

            if (SatchelObjActor.WithinArea(self))
            {
                SatchelObjActor.Trigger(self, SavedInstigator);
            }
        }

        if (V.IsA('RODemolitionVolume'))
        {
            RODemolitionVolume(V).Trigger(self, SavedInstigator);
        }
    }
}

function HandleVehicles()
{
    local Actor         ActorAbove, ActorBelow;
    local Vector        HitLoc, HitNorm;
    local DHVehicle     Veh;
    local int           TrackNum;
    local float         Distance, DamageFactor;

    foreach RadiusActors(Class'DHVehicle', Veh, DamageRadius)
    {
        if (Veh.IsA('DHATGun'))
        {
            continue;
        }

        // Trace DOWN to find engine damage recipient
        if (ActorBelow == none)
        {
            ActorBelow = Trace(HitLoc, HitNorm, Location + (vect(0, 0, -1) >> Veh.Rotation) * EngineDamageRadius, Location, true);
        }

        // Trace UP to find underbody damage bonus recipient
        if (ActorAbove == none)
        {
            ActorAbove = Trace(HitLoc, HitNorm, Location + (vect(0, 0, 1) >> Veh.Rotation) * UNDER_VEHICLE_TRACE_HEIGHT, Location, true);
        }

        // DEAL UNDERBODY DAMAGE BONUS
        if (ActorAbove == Veh && ActorAbove != ActorBelow)
        {
            Veh.TakeDamage(UnderVehicleDamageBonus, SavedInstigator, vect(0, 0, 0), vect(0, 0, 0), MyDamageType);
        }

        // DEAL ENGINE DECK DAMAGE
        if (ActorBelow == Veh && EngineDamageRadius > 0.0 && EngineDamageMax > 0.0 && !Veh.IsVehicleBurning())
        {
            Distance = VSize(Location - Veh.GetEngineLocation());

            // NOTE: There's an edge case where Distance is 0 and we can skip to starting the fire,
            //       but it's practically impossible to get, so taking the shortcut would be more wasteful.

            if (Distance < EngineDamageRadius)
            {
                DamageFactor = Class'UInterp'.static.SmoothStep(Distance / EngineDamageRadius, 1.0, 0.0);

                // Set the engine on fire if we're lucky (chance diminishes with distance);
                // otherwise, apply damage to the engine (damage falls off with distance).
                if (FRand() < DamageFactor)
                {
                    Veh.StartEngineFire(SavedInstigator);
                }
                else
                {
                    Veh.DamageEngine(EngineDamageMax * DamageFactor, SavedInstigator, vect(0, 0, 0), vect(0, 0, 0), MyDamageType);
                }
            }
        }

        // DEAL TREAD DAMAGE
        if (Veh.Health > 0 && Veh.bHasTreads && TreadDamageRadius > 0.0)
        {
            // Set Distance to TreadDamageRadius, we don't want TreadDamageRadius to change, but want Distance to be changed in IsTreadInRadius()
            //
            // TODO: See IsTreadInRadis()
            //
            Distance = TreadDamageRadius;

            if (Veh.IsTreadInRadius(Location, Distance, TrackNum))
            {
                if (TreadDamageMassThreshold > Veh.VehicleMass * Veh.SatchelResistance)
                {
                    // If enough strength we can detrack the vehicle instantly
                    Veh.DestroyTrack(bool(TrackNum));
                }
                else if (TreadDamageMax > 0.0 && Distance < TreadDamageRadius)
                {
                    // Otherwise do minor damage to the tracks
                    Veh.DamageTrack(TreadDamageMax * (1 - Distance / TreadDamageRadius), bool(TrackNum));
                }
            }
        }
    }
}

// Allows satchels to damage obstacles when behind world geometry
function HandleObstacles()
{
    local DHObstacleInstance O;

    if (ObstacleDamageRadius <= 0.0 || ConstructionDamageMax <= 0.0)
    {
        return;
    }

    foreach RadiusActors(Class'DHObstacleInstance', O, ObstacleDamageRadius)
    {
        // If we cannot trace the obstacle (because of world geometry), then apply special radius damage
        if (O != none && !FastTrace(O.Location, Location))
        {
            O.TakeDamage(ObstacleDamageMax * (1 - VSize(Location - O.Location) / ObstacleDamageRadius),
                         SavedInstigator,
                         vect(0, 0, 0),
                         vect(0, 0, 0),
                         MyDamageType);
        }
    }
}

// Allows satchels to do damage to constructions when traces fail (useful if construction is on the otherside of terrain or origin under world)
function HandleConstructions()
{
    local DHConstruction C;

    if (ConstructionDamageRadius <= 0.0 || ConstructionDamageMax <= 0.0)
    {
        return;
    }

    foreach RadiusActors(Class'DHConstruction', C, ConstructionDamageRadius)
    {
        // If we cannot trace the construction (because trace hit world geometry), then apply special radius damage
        if (C != none && !FastTrace(C.Location, Location))
        {
            C.TakeDamage(ConstructionDamageMax * (1 - VSize(Location - C.Location) / ConstructionDamageRadius),
                         SavedInstigator,
                         vect(0, 0, 0),
                         vect(0, 0, 0),
                         MyDamageType);
        }
    }
}

defaultproperties
{
    bAlwaysRelevant=true
    StaticMesh=StaticMesh'WeaponPickupSM.Satchel_throw'
    CollisionRadius=4.0
    CollisionHeight=4.0

    Speed=300.0
    Damage=1200.0
    DamageRadius=1200.0
    UnderVehicleDamageBonus=8400.0

    ConstructionDamageRadius=375.0
    ConstructionDamageMax=750.0

    ObstacleDamageRadius=500.0
    ObstacleDamageMax=1400.0

    EngineDamageMassThreshold=200.0 //3kg TNT should penetrate any top armor or engine desk and severely damage anything under it (even if it is a Maus tank)
    EngineDamageRadius=240.0 //slightly increased because often it seemed like its not close enough even if its on the engine desk
    EngineDamageMax=5000.0

    TreadDamageMassThreshold=200.0
    TreadDamageRadius=100.0
    TreadDamageMax=200.0

    MyDamageType=Class'DH_SatchelDamType'

    ExplosionSoundRadius=4000.0
    ExplosionSound(0)=Sound'Inf_Weapons.satchel_explode01'
    ExplosionSound(1)=Sound'Inf_Weapons.satchel_explode02'
    ExplosionSound(2)=Sound'Inf_Weapons.satchel_explode03'
    ExplodeDirtEffectClass=Class'ROSatchelExplosion'
    ExplodeSnowEffectClass=Class'ROSatchelExplosion'
    ExplodeMidAirEffectClass=Class'ROSatchelExplosion'

    ImpactSound=Sound'DH_WeaponSounds.satcheldrops'
    ImpactSoundDirt=Sound'DH_WeaponSounds.satcheldrops'
    ImpactSoundWood=Sound'DH_WeaponSounds.satcheldrops'
    ImpactSoundMetal=Sound'DH_WeaponSounds.satcheldrops'
    ImpactSoundMud=Sound'DH_WeaponSounds.satcheldrops'
    ImpactSoundGrass=Sound'DH_WeaponSounds.satcheldrops'
    ImpactSoundConcrete=Sound'DH_WeaponSounds.satcheldrops'

    BlurTime=6.0
    BlurEffectScalar=2.1
    ShakeRotMag=(X=0.0,Y=0.0,Z=300.0)
    ShakeRotRate=(Z=2500.0)
    ShakeRotTime=3.0
    ShakeOffsetMag=(Z=10.0)
    ShakeOffsetRate=(Z=200.0)
    ShakeOffsetTime=5.0
    ShakeScale=2.5
}
