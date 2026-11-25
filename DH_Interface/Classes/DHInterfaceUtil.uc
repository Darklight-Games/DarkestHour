//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHInterfaceUtil extends GUI;

var() Material HeaderTop,HeaderBar,HeaderBase;      // Top, Bar and base

final simulated static function int SetROStyle(GUIController MyController, array<GUIComponent> Components)
{
    return Components.Length;
}

final simulated static function int ReformatLists(GUIController MyController, GUIMultiColumnListBox MyListBox)
{
    return -1;
}

defaultproperties
{
    HeaderBase=Texture'DH_GUI_Tex.DHDisplay'
}
