//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHConstructionControlsMessage extends DHControlsMessage
    abstract;

static function string GetHeaderString(
    optional PlayerReplicationInfo RelatedPRI_1,
    optional PlayerReplicationInfo RelatedPRI_2,
    optional Object OptionalObject)
{
    local DHConstructionProxy CP;

    CP = DHConstructionProxy(OptionalObject);

    if (CP == none)
    {
        Warn("OptionalObject is not a DHConstructionProxy (found" @ OptionalObject $ ")");
        return "";
    }

    return CP.GetRuntimeData().MenuName;
}

static function bool ShouldShowControl(int Index, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local DHConstructionProxy CP;

    CP = DHConstructionProxy(OptionalObject);

    if (CP == none)
    {
        Warn("OptionalObject is not a DHConstructionProxy (found" @ OptionalObject $ ")");
        return false;
    }

    switch (Index)
    {
        case 4:
            return CP.GetRuntimeData().bHasVariants;
        case 5:
            return CP.GetRuntimeData().bHasSkins;
        default:
            return true;
    }
}

static function string GetControlText(int Index, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string Text;
    local DHConstructionProxy CP;

    Text = super.GetControlText(Index, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

    CP = DHConstructionProxy(OptionalObject);

    if (CP != none)
    {
        switch (Index)
        {
            case 4:
                Text = Repl(Text, "{variant}", CP.GetVariantNoun());
                break;
            case 5:
                Text = Repl(Text, "{skin}", CP.GetSkinNoun());
                break;
            default:
                break;
        }
    }

    return Text;
}

defaultproperties
{
    Controls(0)=(Keys=("FIRE"),Text="Confirm")
    Controls(1)=(Keys=("ROIRONSIGHTS"),Text="Cancel")
    Controls(2)=(Keys=("LEANLEFT","LEANRIGHT"),Text="Rotate")
    Controls(3)=(Keys=("ROMANUALRELOAD"),Text="Reset")
    Controls(4)=(Keys=("SWITCHFIREMODE"),Text="Change {variant}")
    Controls(5)=(Keys=("ROMGOPERATION"),Text="Change {skin}")
}
