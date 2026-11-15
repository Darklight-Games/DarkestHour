//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHSquadLeaderLogiVolunteerInteraction extends DHPromptInteraction;

var int TeamIndex;
var int SquadIndex;
var int VolunteerIndex;

function Tick(float DeltaTime)
{
    local DHPlayer PC;
    local DHPlayerReplicationInfo VolunteerPRI;

    if (ViewportOwner != none)
    {
        PC = DHPlayer(ViewportOwner.Actor);

        if (PC != none)
        {
            VolunteerPRI = PC.GetSquadLogiVolunteer(VolunteerIndex);

            if (Class'DHPlayerReplicationInfo'.static.IsInSameSquad(DHPlayerReplicationInfo(PC.PlayerReplicationInfo), VolunteerPRI) &&
                !VolunteerPRI.IsLogi())
            {
                return;
            }
        }
    }

    Master.RemoveInteraction(self);
}

function OnOptionSelected(int Index)
{
    local DHPlayer PC;

    if (ViewportOwner != none)
    {
        PC = DHPlayer(ViewportOwner.Actor);

        if (PC != none)
        {
            switch (Index)
            {
                case 0:
                    PC.ServerSquadMakeLogi(PC.GetSquadLogiVolunteer(VolunteerIndex));
                    break;
                case 2:
                    PC.bIgnoreSquadLeaderLogiVolunteerPrompts = true;
                    break;
            }
        }
    }

    Master.RemoveInteraction(self);
}

function string GetPromptText()
{
    local string S;
    local DHPlayer PC;
    local DHPlayerReplicationInfo VolunteerPRI;

    S = PromptText;

    if (ViewportOwner != none)
    {
        PC = DHPlayer(ViewportOwner.Actor);

        if (PC != none)
        {
            VolunteerPRI = PC.GetSquadLogiVolunteer(VolunteerIndex);
        }
    }

    if (VolunteerPRI != none)
    {
        S = Repl(S, "{volunteer}", Class'GameInfo'.static.MakeColorCode(Class'DHColor'.default.SquadColor) $ VolunteerPRI.PlayerName $ Class'GameInfo'.static.MakeColorCode(Class'UColor'.default.White));
    }

    return S;
}

function RemoveInteraction()
{
    local DHPlayer PC;

    if (ViewportOwner != none)
    {
        PC = DHPlayer(ViewportOwner.Actor);

        if (PC != none)
        {
            PC.RemoveSquadLogiVolunteer(VolunteerIndex);
        }
    }

    Master.RemoveInteraction(self);
}

defaultproperties
{
    PromptText="{volunteer} has volunteered for the squad's logi role."
    Options(0)=(Key=IK_F1,Text="Accept")
    Options(1)=(Key=IK_F2,Text="Decline")
    Options(2)=(Key=IK_F3,Text="Ignore All")
    bRequiresTick=true
    VolunteerIndex=-1
}
