// RCX GifAnimation - Slideshowv 1.1.1 - by Lucifera Morningstar 2026
// Plays the textures in this prim as sprite sheet animations, cycling through them when there's more than one, reading columns, rows, frame rate and optional frame count from each name (name;columns;rows;fps;frames).

integer face = ALL_SIDES; // Face to show the animation on, or ALL_SIDES.

// llSetTextureAnim mode flags as the sum of these values; ANIM_ON must always be included.
// ANIM_ON   = 1
// LOOP      = 2
// REVERSE   = 4
// PING_PONG = 8
// Examples: 3 = ANIM_ON + LOOP, 11 = ANIM_ON + LOOP + PING_PONG, 7 = ANIM_ON + LOOP + REVERSE.
integer animFlags = 3;

integer loopsPerSheet = 3; // Times each sheet plays before the next one when there's more than one texture; a ping-pong there and back counts as one.
float stillTime = 5.0; // Seconds a texture with no columns and rows in its name shows when there's more than one texture.
float defaultFps = 10.0; // Frame rate used when a name has columns and rows but no frame rate.

integer sheetCount; // Number of textures in the prim.
integer sheetIndex; // Inventory position of the texture showing now.

showSheet()
{
    string texture = llGetInventoryName(INVENTORY_TEXTURE, sheetIndex);
    list parts = llParseString2List(texture, [";"], []);
    integer cols = llList2Integer(parts, 1);
    integer rows = llList2Integer(parts, 2);
    float fps = llList2Float(parts, 3);
    integer frames = llList2Integer(parts, 4);
    llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_TEXTURE, face, texture, <1.0, 1.0, 0.0>, ZERO_VECTOR, 0.0]);
    llSetTextureAnim(FALSE, face, 0, 0, 0.0, 0.0, 1.0);
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
        if (sheetCount > 1)
        {
            integer loopFrames = frames;
            if (loopFrames == 0)
            {
                loopFrames = cols * rows;
            }
            if (animFlags & PING_PONG)
            {
                loopFrames = loopFrames * 2 - 2;
            }
            if (loopFrames < 1)
            {
                loopFrames = 1;
            }
            llSetTimerEvent((float)(loopsPerSheet * loopFrames) / fps);
        }
    }
    else if (sheetCount > 1)
    {
        llSetTimerEvent(stillTime);
    }
}

startCycle()
{
    llSetTimerEvent(0.0);
    sheetCount = llGetInventoryNumber(INVENTORY_TEXTURE);
    sheetIndex = 0;
    if (sheetCount > 0)
    {
        showSheet();
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
        startCycle();
    }

    changed(integer change)
    {
        if (change & CHANGED_INVENTORY)
        {
            startCycle();
        }
    }

    timer()
    {
        sheetIndex = (sheetIndex + 1) % sheetCount;
        showSheet();
    }
}
