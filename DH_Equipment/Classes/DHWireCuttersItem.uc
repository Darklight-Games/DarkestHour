//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHWireCuttersItem extends DHWeapon;

var     float               CutDistance;
var     DHObstacleInstance  ObstacleBeingCut, ObstacleShouldBeCut;
var     DHConstruction      ConstructionBeingCut, ConstructionShouldBeCut;

// Functions emptied out or returning false, as wire cutters aren't a real weapon
simulated function bool IsFiring(){return false;}
function bool FillAmmo(){return false;}
function bool ResupplyAmmo(){return false;}
exec simulated function ROManualReload() {return;}
simulated function bool IsBusy() {return false;}
simulated function bool ShouldUseFreeAim() {return false;}

// Overriden in Idle state
simulated function Fire(float F);

// Modified to allow same InventoryGroup item (this shares same slot as shovel/satchel, each item on the slot requires multi-item support)
function bool HandlePickupQuery(Pickup Item)
{
    local int i;

    // If no passed item, prevent pick up & stops checking rest of Inventory chain
    if (Item == none)
    {
        return true;
    }

    // Pickup weapon is same as this weapon, so see if we can carry another
    if (Class == Item.InventoryType && WeaponPickup(Item) != none)
    {
        for (i = 0; i < NUM_FIRE_MODES; ++i)
        {
            if (AmmoClass[i] != none && AmmoCharge[i] < MaxAmmo(i) && WeaponPickup(Item).AmmoAmount[i] > 0)
            {
                AddAmmo(WeaponPickup(Item).AmmoAmount[i], i);

                // Need to do this here as we're going to prevent a new weapon pick up, so the pickup won't give a screen message or destroy/respawn itself
                Item.AnnouncePickup(Pawn(Owner));
                Item.SetRespawn();

                break;
            }
        }

        return true; // prevents pick up, as already have weapon, & stops checking rest of Inventory chain
    }

    // Didn't do any pick up for this weapon, so pass this query on to the next item in the Inventory chain
    // If we've reached the last Inventory item, returning false will allow pick up of the weapon
    return Inventory != none && Inventory.HandlePickupQuery(Item);
}

simulated state Cutting
{
    simulated function BeginState()
    {
        if (DHPawn(Instigator) != none)
        {
            DHPawn(Instigator).SetIsCuttingWire(true);
            //DHPawn(Instigator).bCanCutWire = false;
        }

        PlayAnim('cutStart');

        if (ObstacleBeingCut != none)
        {
            SetTimer(ObstacleBeingCut.Info.GetCutDuration(), false);
        }
        else if (ConstructionBeingCut != none)
        {
            SetTimer(ConstructionBeingCut.default.CutDuration, false);
        }
    }

    simulated function EndState()
    {
        local DHPawn P;

        P = DHPawn(Instigator);

        if (P != none)
        {
            P.SetIsCuttingWire(false);
        }
    }

    simulated function Tick(float DeltaTime)
    {
        super.Tick(DeltaTime);

        // A fail safe to get out of this state if either something went wrong or somehow we shouldn't continue
        if ((ConstructionBeingCut == none && ObstacleBeingCut == none) ||
            (ObstacleBeingCut != none && ObstacleBeingCut.Info.IsCleared()) ||
            (ConstructionBeingCut != none && !ConstructionBeingCut.CanBeCut()))
        {
            GotoState('');
            PlayAnim('cutEnd', 1.0, 0.2);
        }
    }

    simulated function Timer()
    {
        local DHPlayer P;

        if (Instigator != none)
        {
            P = DHPlayer(Instigator.Controller);
        }

        if (ObstacleBeingCut != none && P != none)
        {
            P.ServerClearObstacle(ObstacleBeingCut.Info.Index);
        }
        else if (ConstructionBeingCut != none && P != none)
        {
            P.ServerCutConstruction(ConstructionBeingCut);
        }

        GotoState('');
        PlayAnim('cutEnd', 1.0, 0.2);
    }

    simulated function AnimEnd(int Channel)
    {
        local name  SeqName;
        local float AnimRate, AnimFrame;

        GetAnimParams(Channel, SeqName, AnimFrame, AnimRate);

        super.AnimEnd(Channel);

        switch (SeqName)
        {
            case 'cutStart':
                PlayAnim('cutVin');
                break;
            case 'cutVin':
                PlayAnim('cutVout');
                break;
            case 'cutVout':
                PlayAnim('cutHin');
                break;
            case 'cutHin':
                PlayAnim('cutHout');
                break;
            case 'cutHout':
                PlayAnim('cutVin');
                break;
            default:
                break;
        }
    }

    simulated function bool WeaponCanSwitch();
    simulated function bool WeaponAllowCrouchChange();
    simulated function bool WeaponAllowProneChange();
}

simulated state Idle
{   
    simulated function Fire(float F)
    {
        if (CanCut())
        {
            if (ObstacleShouldBeCut != none)
            {
                ObstacleBeingCut = ObstacleShouldBeCut;
            }

            if (ConstructionShouldBeCut != none)
            {
                ConstructionBeingCut = ConstructionShouldBeCut;
            }
            
            GotoState('Cutting');
        }  
    }
    
    simulated function Tick(float DeltaTime)
    {
        local DHPawn P;

        P = DHPawn(Instigator);

        if (P != none)
        {
            P.bCanCutWire = CanCut();
        }

        super.Tick(DeltaTime);
    }

    simulated function bool CanCut()
    {
        local DHConstruction C;
        local DHObstacleInstance O;
        local DHPawn P;
        local Vector HitLocation, HitNormal, TraceEnd, TraceStart;

        if (Level.NetMode == NM_DedicatedServer)
        {
            return false;
        }

        P = DHPawn(Instigator);

        if (P == none || P.Weapon != self || P.Controller == none || P.Velocity != vect(0.0, 0.0, 0.0) || P.IsProneTransitioning())
        {
            return false;
        }
        
        TraceStart = P.Location;
        TraceEnd = TraceStart + (Vector(P.Controller.Rotation) * CutDistance);
        
        // Support for obstacles
        foreach TraceActors(Class'DHObstacleInstance', O, HitLocation, HitNormal, TraceEnd, TraceStart, vect(1.0, 1.0, 1.0))
        {
            if (O != none && !O.Info.IsCleared() && O.Info.CanBeCut())
            {   
                ObstacleShouldBeCut = O;
                return true;
            }
        }

        // Support for constructions
        foreach TraceActors(Class'DHConstruction', C, HitLocation, HitNormal, TraceEnd, TraceStart, vect(1.0, 1.0, 1.0))
        {
            if (C != none && C.CanBeCut())
            {   
                ConstructionShouldBeCut = C;
                return true;
            }
        }
        
        return false;
    }
    
    simulated function EndState()
    {   
        local DHPawn P;

        P = DHPawn(Instigator);

        super.EndState();

        if (P != none)
        {
            P.bCanCutWire = false;
        }
    }
}

simulated event Destroyed()
{
    local DHPawn P;

    P = DHPawn(Instigator);

    if (P != none)
    {
        P.bCanCutWire = false;
    }

    super.Destroyed();
}

defaultproperties
{
    ItemName="Wire Cutters"
    AttachmentClass=Class'DHWireCuttersAttachment'
    PickupClass=Class'DHWireCuttersPickup'
    InventoryGroup=7
    GroupOffset=2
    Priority=1
    CutDistance=100.0

    Mesh=SkeletalMesh'DH_Wirecutters_1st.wirecutters'

    DisplayFOV=70.0
    IronSightDisplayFOV=70.0
    PlayerFOVZoom=10.0
    bPlayerFOVZooms=true
    ZoomInTime=0.4
    ZoomOutTime=0.2
    bUsesFreeAim=false
    bCanSway=false
    bCanResupplyWhenEmpty=false

    SelectAnim="Draw"
    PutDownAnim="putaway"

    AIRating=0.0
    CurrentRating=0.0
}
