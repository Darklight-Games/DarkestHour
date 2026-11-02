//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHActorProxyProjector extends DynamicProjector
    notplaceable;

var Material GreenTexture;
var Material RedTexture;
var Material OrangeTexture;

defaultproperties
{
    GreenTexture=Material'DH_Construction_tex.aura_green'
    RedTexture=Material'DH_Construction_tex.aura_red'
    OrangeTexture=Material'DH_Construction_tex.aura_orange'
    bNoProjectOnOwner=true
    bProjectActor=false
    bProjectOnAlpha=true
    bProjectParticles=false
    bProjectBSP=true
    MaterialBlendingOp=PB_AlphaBlend
    ProjTexture=Texture'DH_Construction_tex.construction_aura'
    FrameBufferBlendingOp=PB_AlphaBlend
    FOV=1
}
