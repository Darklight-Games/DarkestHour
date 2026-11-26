//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_GiveChuteTrigger extends Trigger;

// Modified to give a touching player a parachute & static line. This is done regardless of ReTriggerDelay, which is
// trigger-wide rather than per-player, so it would otherwise deny a chute to anyone touching within the delay of another
// player (e.g. a group of paratroopers spawning in or jumping from a plane together).
function Touch(Actor Other)
{
    local Actor Inst;
    local DHPawn P;

    super.Touch(Other);

    if (!IsRelevant(Other))
    {
        return;
    }

    Inst = FindInstigator(Other);

    if (Inst != none)
    {
        P = DHPawn(Inst.Instigator);
    }

    if (P != none)
    {
        P.GiveChute();
    }
}

defaultproperties
{
    ReTriggerDelay=0.5 // throttles the trigger's event & message only; chutes are always given
}
