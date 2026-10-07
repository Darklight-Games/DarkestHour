//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO: Should maybe just have an "ignore placement rules" flag?
//==============================================================================

class DHMountedWeaponProxy extends DHConstructionProxy;

// Modified to skip all of the normal construction checks since this object is already in-hand.
// TODO: keep the check that the player is busy (running, crawling etc.)
function DHActorProxy.ActorProxyError GetContextError(Context Context)
{
    local ActorProxyError Error;

    Error.Type = ERROR_None;

    return Error;
}

function ActorProxyError GetPawnError()
{
    local DHPawn P;
    local ActorProxyError E;

    P = DHPawn(Instigator);

    if (P != none && (P.bLeanLeft || P.bLeanRight)) // Do not allow player to deploy mmg/mortar while he is leaning
    {
        E.Type = ERROR_Leaning;
        return E;
    }
}

protected simulated function bool CanPlaceInDangerZone()
{
    // There's no reason to restrict mounted weapons from being placed in the danger zone.
    return true;
}

