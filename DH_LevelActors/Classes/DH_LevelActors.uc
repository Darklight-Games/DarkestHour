//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DH_LevelActors extends Actor
    hidecategories(Collision, Lighting, LightColor, Karma, Force, Advanced, Sound)
    placeable;

// Setup some common enums used throughout the child actors
// usagi:ignore[enum-name-prefix]
enum ROSideIndex
{
    AXIS,
    ALLIES,
    NEUTRAL, // Either side can use this vehicle
};

// usagi:ignore[enum-name-prefix]
enum NumModifyType
{
    NMT_Add,
    NMT_Subtract,
    NMT_Set, // Will set the value instead of modify it
};

// usagi:ignore[enum-name-prefix]
enum StatusModifyType
{
    SMT_Activate,
    SMT_Deactivate,
    SMT_Toggle, // Will toggle the status
};

defaultproperties
{
    Texture=Texture'DHEngine_Tex.LevelActor'
    bHidden=true
    RemoteRole=ROLE_None
}
