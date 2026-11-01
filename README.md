# Sprite Sheet Maker — Readme

Current version: 0.9.3

Sprite Sheet Maker is a Windows program that turns animated GIFs (also animated WebP and PNG) and short video clips into square PNG sprite sheets for Second Life's `llSetTextureAnim`. It can also save video clips as animated GIFs.

## Program folder
Keep these files together in one folder of your choice:
- `SpriteSheetMaker_v0.9.3.exe`: the program.
- `SpriteSheetMaker_Readme.md`: this guide, shown by Help > Readme.
- `SpriteSheetMaker_ReleaseNotes.md`: what changed in each version, shown by Help > Release Notes.
- `settings.ini`: created the first time the program runs and saved again when it closes. It holds your Preferences, your Visual Mode choice and the remembered positions of the main window and the expanded preview. You can edit it by hand while the program is closed, or delete it to go back to the defaults. If the folder can't be written to, the program still runs but doesn't keep its settings.

The program is unsigned, so Windows SmartScreen may warn the first time you run it. Click "More info", then "Run anyway".

## The window
The menus are at the top. The left side holds the settings, the results, the Save buttons and the animation preview settings. The right side shows the sprite sheet with the animation preview below it. You can make the window larger or maximise it, and the previews grow to use the space.

The window follows the display scale of the monitor it's on (100%, 125%, 150% and so on), and adjusts when you move it to a monitor with a different scale. Preferences, the GIF Settings box, the expanded preview and the Readme and Release Notes windows do the same, each on their own.

## Visual Mode
**View > Visual Mode** switches between **Light**, **Dark** and **Use Windows Settings** (the default, which follows the "Choose your default app mode" setting in Windows' Personalization > Colors). The change applies straight away and is remembered.

Windows' setting is read when the program starts and when you pick Use Windows Settings. If you change it in Windows while the program is open, restart the program (or pick Use Windows Settings again) to follow it.

Dark mode covers the program's own windows, including their title bars on Windows 10 (2020 or later) and Windows 11. The menu bar and menus, and Windows' own boxes (Open, Save, folder and colour pickers, and messages), keep Windows' light look. In Dark mode the buttons, checkboxes and dropdowns look a little flatter, because the standard Windows style can't be darkened.

## Making a sprite sheet
1. Open a file with **File > Open GIF or Video...** (Ctrl+O), by dropping it onto the sprite sheet preview, or by dropping it onto the program's icon. The Source panel shows the file's size and its number of frames.
2. For a GIF, you can use **Use every Nth frame** to thin out a long animation.
   For a video, set **Start**, **End** and **Frames to take**, then click **Extract Frames** (Ctrl+E, also in the Edit menu). When a video is opened, frames are extracted automatically from the whole clip.
3. In **Sheet Layout**, Automatic picks the number of columns and rows for you; Manual lets you type them. Set the **Edge padding** (see below), the texture size (512, 1024 or 2048) and the frame fit:
   - **Stretch** fills each cell with the frame.
   - **Keep aspect** keeps the picture's true proportions on the face shape you choose in the animation preview, and fills the leftover space with **Bars**: either a solid **Color** (click the swatch to choose it; black to start) or **Transparent**.
   **Resize** chooses how frames are scaled to fit their cells: **Smooth** (the default) for videos and ordinary GIFs, or **Sharp** for pixel art, which keeps every pixel a crisp block. It also applies to Save GIF, and starts on Smooth each time the program opens.
4. Click any frame in the sheet preview to remove it; later frames move back to fill the gap. **Undo** (Ctrl+Z) brings back the last removed frame and **Restore All** (Ctrl+Shift+Z) brings back all of them. Both are also in the Edit menu.
5. In the animation preview settings, choose the shape of the prim face the animation will play on (Landscape or Portrait, then a ratio), and the **FPS**. The play mode settings below them let you check how the sheet plays with different `llSetTextureAnim` settings (see Play modes). **Expand Preview** opens a larger, resizable preview window.
6. Click **Save Sprite Sheet** (Ctrl+S). For videos you can also click **Save GIF...** (Ctrl+Shift+S), which first opens GIF Settings.

View > Show Grid Lines shows or hides the cell grid on the sheet preview. View > Preview picks the face shape: 1:1 is at the top (it fits both orientations), and clicking the Landscape or Portrait heading switches the orientation, the same as the dropdown. Help > About shows the version.

## Using the sheet in Second Life
The saved file is named like `clip1k;4;4;12.5;14.png`: the source name with the texture size (512, 1k or 2k), then the columns, the rows, the FPS and the number of frames, separated by semicolons. Whole rates are written without decimals (`10`, not `10.0`), and any semicolon in the source name is changed to an underscore. This is the `name;columns;rows;fps` layout that common texture animation scripts read from the texture's name when it's dropped into a prim, so the sheet can be used with them without renaming; scripts that don't know about the frame count ignore it. To set the animation yourself, use those numbers in your script:

```
llSetTextureAnim(ANIM_ON | LOOP, ALL_SIDES, columns, rows, 0.0, frames, fps);
```

The number of frames is the last number in the file name and is also shown in the Result panel. If the grid has empty cells at the end, they're never shown as long as you pass the real frame count.

With **Keep aspect**, the sheet is made for the face shape chosen in the preview, so put it on a face with that shape. With **Stretch**, the picture looks right on a face with the same proportions as the original.

## Edge padding
Second Life blends each pixel with its neighbours when it draws a texture, so at the edge of the face a thin, moving line of the neighbouring frame can show in-world, especially up close. Edge padding replaces it with a steady line of one colour: each frame is made a little smaller and surrounded by a border that's the same in every cell, so the blending at the edge only mixes that colour with itself. The grid and the numbers for `llSetTextureAnim` don't change.

- **Stretch**: the border is black.
- **Keep aspect**: the border is the bar colour, or transparent with Transparent bars. Only the sides where the picture reaches the edge of its cell get a border; the other sides already have bars.

Set it from 0 to 5 pixels in Sheet Layout; it starts at the default set in Preferences (0 to begin with). Second Life often shows a 2048 texture at half or a quarter of its size, which thins the border by the same amount, so use 2 or more for 2048 sheets (4 to be safe). On very small cells a large padding leaves little room for the picture, which the preview shows.

The bleed is more likely when the Result panel warns that the grid doesn't divide the texture evenly.

## Transparency
Empty cells at the end of the grid are filled with black. A sheet with no transparent pixels at all is saved without an alpha channel, so Second Life treats it as opaque. A sheet keeps its alpha channel when it has transparent bars or padding, or when the GIF itself has transparency; in-world, such a face may need its alpha mode set.

## FPS
The FPS box sets the playback speed of the preview, the rate in the saved file name and the timing of a saved GIF. When frames are loaded it's set to the suggested rate worked out from the file, and that suggested rate is listed first in the dropdown, above your presets, so you can go back to it after trying others. You can also type any rate.

Above 50 fps Save GIF is greyed out, because GIFs can't play that fast. GIF timing is stored in hundredths of a second, so only rates like 50, 33.3, 25, 20 and 16.7 play exactly; others are rounded (24 plays as 25).

If a GIF's frames have uneven timing, the Result panel says so: `llSetTextureAnim` plays every frame for the same time, so the average is used.

## Play modes
The animation preview can play the sheet the way `llSetTextureAnim` would with other settings, so you can check them before going in-world. They only affect the preview: the sheet, the saved file and Save GIF stay the same, and they start at their defaults each time the program opens.
- **Loop** (ticked to start): plays over and over, like `LOOP`. Unticked, the preview plays once and stays on the last frame shown.
- **Reverse**: plays backwards, like `REVERSE`.
- **Ping-pong**: plays forwards then backwards, like `PING_PONG`, without showing the end frames twice. With Loop unticked, it finishes on the first frame. Reverse and Ping-pong can be used together.
- **Start** and **Length**: which cells play, matching the start and length values in your script. Start counts from 0, like the script does, so the first cell is 0. They start out covering every frame. Cells after the last frame are black, and the preview shows them if Length reaches them, just as Second Life would.
- **Replay**: starts the preview again from the beginning.

The script line for these settings looks like this, with the mode flags added together:

```
llSetTextureAnim(ANIM_ON | LOOP | PING_PONG, ALL_SIDES, columns, rows, start, length, fps);
```

When frames are removed or added back, or the grid changes, a range that covers every frame keeps doing so. Any other range is kept, trimmed if it no longer fits the grid. Opening a file or extracting frames resets it to every frame.

## Expand Preview
Opens a separate window playing the animation at the chosen face shape and FPS. It can be resized by dragging, and its height snaps back to the face shape. The bar at the bottom has the same orientation, FPS, ratio and play mode controls as the main window, and changes in either place apply to both. The small preview pauses while it's open.

## Video
Common video formats work, including MP4, MOV, M4V, WebM, AVI, MKV, WMV, MPG, FLV and 3GP. Sound is ignored. Phone videos filmed sideways are turned upright.

Frames are taken at evenly spaced times between Start and End. When they're far apart, for example a few frames from a long clip, the program jumps ahead to each one instead of reading the whole clip, so extraction finishes sooner. The frames picked are the same either way. Frames to take can't be more than the grid size limit squared (64 with the standard 8 × 8 limit).

To save memory, frames are stored at a reduced size when many are taken (see "Limit frame size to save memory" in Preferences). If Windows runs out of memory anyway, extraction stops with a message suggesting fewer frames or a smaller frame size.

## Saving a GIF
Save GIF opens **GIF Settings**, then asks where to save:
- **GIF width** in pixels (it remembers the last value).
- **Reverse**: the GIF plays backwards.
- **Ping-pong**: the GIF plays forwards then backwards, without showing the end frames twice, so the loop has no pause. Combined with Reverse it starts from the last frame.
- **Play once**: the GIF plays a single time instead of looping forever. With Ping-pong, it finishes on the frame it started on.

The checkboxes are separate from the preview's play modes, start unticked each time the program opens, and stay as you left them while it's open. The GIF uses one shared set of 256 colours for all frames, so colours don't flicker between frames.

## Preferences
**File > Preferences...** (Ctrl+P) sets the program's defaults. OK saves them; Cancel discards your changes. FPS presets, video settings, the GIF width, the grid size limit and the folder settings apply straight away. The rest apply the next time the program starts, so they don't change what's on screen.
- **Sprite Sheet**: texture size, Automatic or Manual layout, manual columns and rows, the default edge padding (0 to 5 pixels), and the grid size limit (8, 16, 32 or 64 columns and rows; untick it to allow up to 255).
- **Frames**: frame fit, bars and bar colour.
- **Animation Preview**: orientation, face shape, grid lines and the FPS presets (a comma-separated list).
- **Video**: frames to take, the largest frame size when extracting, the default GIF width, and "Limit frame size to save memory".
- **Windows**: where the main window and the expanded preview open: their last position, or centred on a chosen monitor. **Identify Monitors** shows each monitor's number on its screen for 2 seconds.
- **Folders**: whether Open and Save start in a default folder, and which folder (set it with **Browse...**).

## Folders
With "Use default folder" ticked, Open and Save start in that folder. Otherwise they start in the last folder you opened a file from or saved to, or on the Desktop the first time. If the default folder is missing (deleted, renamed or on a disconnected drive), the program tells you once and uses the last folder instead.

Desktop, Documents, Downloads, Pictures, Videos and Music are shown and stored by name (for example `Documents\SL Textures`), so they keep working if Windows moves those folders.

## Closing a file
**File > Close Current File** (Ctrl+W) unloads the current file: the sheet preview shows the drop hint again, the animation preview goes blank, and the expanded preview closes. Your Sheet Layout, face shape and play mode settings stay as they are.

## Unsaved changes
If the sprite sheet has changed since you last saved it, opening another file, closing the current file or closing the program asks whether to save it first (Yes, No or Cancel).

## Readme and Release Notes windows
Help > Readme (F1) and Help > Release Notes each open in their own window over the main window, with a table of contents at the top. Click an entry to jump to that section, and "Back to contents" at the end of each section to return. The windows can stay open while you work.

## Keyboard shortcuts
These work from the main window, the expanded preview and the Readme and Release Notes windows. They're also shown beside their items in the menus.
- **Ctrl+O**: open a GIF or video.
- **Ctrl+S**: save the sprite sheet.
- **Ctrl+Shift+S**: save a GIF (videos only).
- **Ctrl+W**: close the current file (asks first if the sprite sheet has unsaved changes).
- **Ctrl+P**: Preferences.
- **Ctrl+Q**: exit (asks first if the sprite sheet has unsaved changes).
- **Ctrl+E**: extract frames (videos only).
- **Ctrl+Z**: undo the last removed frame.
- **Ctrl+Shift+Z**: restore all removed frames.
- **F1**: open this Readme.
