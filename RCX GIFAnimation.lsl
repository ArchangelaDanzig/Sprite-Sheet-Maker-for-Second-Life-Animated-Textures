// GifAnim2 v1.0.1
// Shows the first texture in this prim as a sprite sheet animation, reading columns, rows, frame rate and optional frame count from its name (name;columns;rows;fps;frames), then optionally deletes itself.

integer face = ALL_SIDES; // Face to show the animation on, or ALL_SIDES.

// llSetTextureAnim mode flags as the sum of these values; ANIM_ON must always be included.
// ANIM_ON   = 1
// LOOP      = 2
// REVERSE   = 4
// PING_PONG = 8
// Examples: 3 = ANIM_ON + LOOP, 11 = ANIM_ON + LOOP + PING_PONG, 7 = ANIM_ON + LOOP + REVERSE.
integer animFlags = 3;

float defaultFps = 10.0; // Frame rate used when a name has columns and rows but no frame rate.
integer selfDelete = TRUE; // TRUE deletes this script once the texture is set; the texture and animation stay on the prim.

showSheet(string texture)
{
    list parts = llParseString2List(texture, [";"], []);
    integer cols = llList2Integer(parts, 1);
    integer rows = llList2Integer(parts, 2);
    float fps = llList2Float(parts, 3);
    integer frames = llList2Integer(parts, 4);
    llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_TEXTURE, face, texture, <1.0, 1.0, 0.0>, ZERO_VECTOR, 0.0]);
    if (cols > 0 && rows > 0)
    {
        if (fps <= 0.0)
        {
            fps = defaultFps;
        }
        if (frames < 1 || frames > cols * rows)
        {
            frames = 0;
        }
        llSetTextureAnim(animFlags, face, cols, rows, 0.0, (float)frames, fps);
    }
    else
    {
        llSetTextureAnim(FALSE, face, 0, 0, 0.0, 0.0, 1.0);
    }
}

default
{
    state_entry()
    {
        string texture = llGetInventoryName(INVENTORY_TEXTURE, 0);
        if (texture != "")
        {
            showSheet(texture);
            if (selfDelete)
            {
                llRemoveInventory(llGetScriptName());
            }
        }
    }

    changed(integer change)
    {
        if (change & CHANGED_INVENTORY)
        {
            llResetScript();
        }
    }
}