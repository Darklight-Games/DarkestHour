//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHMountedWeaponControlsMessage extends DHControlsMessage
    abstract;

static function bool ShouldShowControl(int Index, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local DHMountedWeapon MW;

    MW = DHMountedWeapon(OptionalObject);

    if (MW == none)
    {
        return false;
    }

    switch (Index)
    {
        case 1:
            return MW.default.ConstructionClass.static.GetVariantCount() > 1;
        default:
            return true;
    }
}

static function string GetControlText(int Index, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string Text;
    local DHMountedWeapon MW;

    Text = super.GetControlText(Index, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

    MW = DHMountedWeapon(OptionalObject);

    if (MW != none && MW.ConstructionClass != none)
    {
        switch (Index)
        {
            case 1:
                Text = Repl(Text, "{variant}", MW.ConstructionClass.default.VariantNoun);
                break;
            default:
                break;
        }
    }

    return Text;
}

defaultproperties
{
    Controls(0)=(Keys=("DEPLOY"),Text="Deploy")
    Controls(1)=(Keys=("SWITCHFIREMODE"),Text="Change {variant}")
}
