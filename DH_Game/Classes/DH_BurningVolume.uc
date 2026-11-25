//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// just a legacy class for backwards compatibility, as DHBurningVolume is now in DH_Engine code package
// TODO - this class should be removed in some future release when people have had time to convert maps to the new actor
// NOTE: making this actor notplacable would not result in it being deleted from maps when rebuilt, but would stop it being added

class DH_BurningVolume extends DHBurningVolume 
    placeable;
