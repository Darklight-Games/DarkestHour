//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHPlayerChatManager extends UnrealPlayerChatManager;

// Overriden to add server mandated voice bans
event bool AcceptVoice(PlayerReplicationInfo SenderPRI)
{
    local int i;

    if (SenderPRI == none)
    {
        return true;
    }

    if (DHPlayerReplicationInfo(SenderPRI) != none && DHPlayerReplicationInfo(SenderPRI).bRestrictOutboundVoice)
    {
        return false;
    }

    i = GetIDIndex(SenderPRI.PlayerID);

    if (!IsValid(i))
    {
        return true;
    }

    return !bool(ChatRestrictions[i].Restriction & NOVOICE);
}

defaultproperties
{
}
