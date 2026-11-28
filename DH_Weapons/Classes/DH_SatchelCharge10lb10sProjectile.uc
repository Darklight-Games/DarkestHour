//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_SatchelCharge10lb10sProjectile extends DHThrowableExplosiveProjectile; // incorporating SatchelCharge10lb10sProjectile & ROSatchelChargeProjectile

const UNDER_VEHICLE_TRACE_HEIGHT = 64.0;
const UNDER_VEHICLE_SEARCH_RADIUS = 200.0; // Used to check if explosive is under a vehicle.
                                           // Search radius should be about half-length of the longest vehicle
                                           // (keep it on the low for better performance).

var float UnderVehicleDamageBonus; // Extra damage applied on top of normal damage if explosive is under a vehicle

var float ConstructionDamageRadius; // A radius that will damage Contructions
var float ConstructionDamageMax;

var float ObstacleDamageRadius; // A radius that will damage Obstacles
var float ObstacleDamageMax;

var float EngineDeckArmorThicknessThreshold; // How much engine deck armor the explosive can get through
var float EngineDamageRadius; // A radius that will damage Vehicle Engines
var float EngineDamageMax;

var float TreadDamageMassThreshold; // A mass threshold at which a vehicle will take min damage instead of destroying the tread outright
var float TreadDamageRadius; // A radius that will damage Vehicle Treads
var float TreadDamageMax;

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
    local Volume V;

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

function GiveUnderbodyDamage()
{
    local DHVehicle V;
    local Actor ActorAbove;
    local vector HitNorm, HitLoc;

    foreach RadiusActors(Class'DHVehicle', V, UNDER_VEHICLE_SEARCH_RADIUS)
    {
        if (V.IsA('DHATGun'))
        {
            continue;
        }

        ActorAbove = Trace(HitLoc,
                           HitNorm,
                           Location + (vect(0, 0, 1) >> V.Rotation) * UNDER_VEHICLE_TRACE_HEIGHT,
                           Location,
                           true);

        if (ActorAbove == V)
        {
            V.TakeDamage(UnderVehicleDamageBonus,
                        SavedInstigator,
                        vect(0, 0, 0),
                        vect(0, 0, 0),
                        MyDamageType);
        }
    }
}

function DHVehicle GetEngineDamageTarget()
{
    local DHVehicle V;
    local Actor ActorBelow;
    local vector HitNorm, HitLoc, Delta;

    V = DHVehicle(Base);

    // Explosive has landed on top of a vehicle
    if (V != none)
    {
        return V;
    }

    // Explosive maybe detonated above a vehicle
    // NOTE: Radius is increased so we don't miss the vehicle actor the engine belongs to
    foreach RadiusActors(Class'DHVehicle', V, EngineDamageRadius + 200.0)
    {
        if (V.IsA('DHATGun'))
        {
            continue;
        }

        // Get an aproximate idea where we are in relation to the engine
        // NOTE: Assumes that engine hitpoint is not floating over the vehicle.
        Delta = (Location - V.GetEngineLocation()) << V.Rotation;

        if (Delta.Z < 0)
        {
            continue;
        }

        ActorBelow = Trace(HitLoc,
                           HitNorm,
                           Location + (vect(0, 0, -1) >> V.Rotation) * EngineDamageRadius,
                           Location,
                           true);

        if (ActorBelow == V)
        {
            return V;
        }
    }

    return none;
}

function GiveEngineDamage(DHVehicle V)
{
    local float DamageFactor, Distance;
    local DHArmoredVehicle AV;

    if (EngineDamageRadius <= 0.0
        || EngineDamageMax <= 0.0
        || V == none
        || V.Health <= 0
        || V.EngineHealth <= 0
        || V.IsA('DHATGun'))
    {
        return;
    }

    Distance = VSize(Location - V.GetEngineLocation());

    if (Distance > EngineDamageRadius)
    {
        // Detonated too far
        return;
    }

    AV = DHArmoredVehicle(V);

    if (AV != none && AV.EngineDeckArmorThickness > EngineDeckArmorThicknessThreshold)
    {
        return;
    }

    DamageFactor = Class'UInterp'.static.SmoothStep(Distance / EngineDamageRadius, 1.0, 0.0);

    // NOTE: The closer the satchel to the engine, the more likely it will start a fire.
    //       This is counter-intuitive because engine fire is a damage-over-time effect,
    //       and we want to obliterate the engine immediately in such cases.
    if (FRand() < DamageFactor)
    {
        V.StartEngineFire(SavedInstigator);
    }
    else
    {
        V.DamageEngine(EngineDamageMax * DamageFactor, SavedInstigator, vect(0, 0, 0), vect(0, 0, 0), MyDamageType);
    }
}

function HandleVehicles()
{
    local DHVehicle     V, EngineDamageTarget;
    local int           TrackNum;
    local float         Distance;

    // DEAL UNDERBODY DAMAGE OR ENGINE DAMAGE

    EngineDamageTarget = GetEngineDamageTarget();

    if (EngineDamageTarget == none)
    {
        GiveUnderbodyDamage();
    }
    else
    {
        GiveEngineDamage(EngineDamageTarget);
    }

    // DEAL TREAD DAMAGE

    if (TreadDamageRadius <= 0.0)
    {
        return;
    }

    foreach RadiusActors(Class'DHVehicle', V, TreadDamageRadius + 250.0)
    {
        if (V.IsA('DHATGun') || !V.bHasTreads || V.Health <= 0)
        {
            continue;
        }

        // Set Distance to TreadDamageRadius, we don't want TreadDamageRadius to change, but want Distance to be changed in IsTreadInRadius()
        //
        // TODO: See IsTreadInRadis()
        //
        Distance = TreadDamageRadius;

        if (!V.IsTreadInRadius(Location, Distance, TrackNum))
        {
            continue;
        }

        if (TreadDamageMassThreshold > V.VehicleMass * V.SatchelResistance)
        {
            // If enough strength we can detrack the vehicle instantly
            V.DestroyTrack(bool(TrackNum));
        }
        else if (TreadDamageMax > 0.0 && Distance < TreadDamageRadius)
        {
            // Otherwise do minor damage to the tracks
            V.DamageTrack(TreadDamageMax * (1 - Distance / TreadDamageRadius), bool(TrackNum));
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

    EngineDamageRadius=220.0
    EngineDamageMax=800.0
    EngineDeckArmorThicknessThreshold=60.0

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
