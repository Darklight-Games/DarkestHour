//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class DHBackAttachment extends BackAttachment;

// The mesh is not replicated because a mesh in a package flagged
// `ServerSideOnly` cannot be serialized and would arrive on clients as `None`.
// Instead, we replicate the attachment class and each client applies the
// appearance (mesh, skins, idle animation) from the class defaults itself.
var class<InventoryAttachment> AttachmentClass;
var class<InventoryAttachment> AppliedAttachmentClass; // Client-side only, used to detect a change of `AttachmentClass`.

replication
{
    // Variables the server will replicate to all clients.
    reliable if (bNetDirty && Role == ROLE_Authority)
        AttachmentClass;
}

// Modified to replicate the attachment class instead of the mesh, and to apply
// the appearance of the attachment locally (for a listen server or standalone).
// I is the inventory item that is being put on the pawn's back.
function InitFor(Inventory I)
{
    super.InitFor(I);

    if (I == none)
    {
        return;
    }

    AttachmentClass = I.AttachmentClass;
    ApplyAttachmentClass();
}

// Applies the appearance of the attachment on clients whenever a new
// attachment class has been received from the server.
simulated event PostNetReceive()
{
    if (AttachmentClass != AppliedAttachmentClass)
    {
        ApplyAttachmentClass();
    }
}

// Sets the mesh, relative offsets, skins and idle animation based on the
// defaults of `AttachmentClass`.
simulated function ApplyAttachmentClass()
{
    local int j;
    local class<DHWeaponAttachment> WA;

    AppliedAttachmentClass = AttachmentClass;

    if (AttachmentClass == none)
    {
        return;
    }

    LinkMesh(AttachmentClass.default.Mesh);

    WA = class<DHWeaponAttachment>(AttachmentClass);

    if (WA == none)
    {
        return;
    }

    SetRelativeLocation(WA.default.BackAttachmentLocationOffset);
    SetRelativeRotation(WA.default.BackAttachmentRotationOffset);

    if (HasAnim(WA.default.WA_Idle))
    {
        PlayAnim(WA.default.WA_Idle);
    }

    Skins.Length = 0;

    for (j = 0; j < WA.default.Skins.Length; ++j)
    {
        if (WA.default.Skins[j] != none)
        {
            Skins[j] = WA.default.Skins[j];
        }
    }
}

defaultproperties
{
    bNoRepMesh=true
    bNetNotify=true
}
