# Sprite Sheet Maker — Readme

Current version: 0.19.2

Sprite Sheet Maker is a Windows program that turns animated GIFs (also animated WebP and PNG), short video clips and image sequences (folders of numbered pictures) into square PNG sprite sheets for Second Life's `llSetTextureAnim`. It can also save video clips and image sequences as animated GIFs.

## Program folder
Keep these files together in one folder of your choice:
- `SpriteSheetMaker_v0.19.2.exe`: the program.
- `SpriteSheetMaker_Readme.md`: this guide, shown by Help > Readme.
- `SpriteSheetMaker_ReleaseNotes.md`: what changed in each version, shown by Help > Release Notes.
- `Languages` folder: one file per language besides English (see Language). Without it the program runs in English.
- `settings.ini`: created the first time the program runs and saved again when it closes. It holds your Preferences, your Visual Mode, Language and Show Tooltips choices, and the remembered positions of the main window and the expanded preview. You can edit it by hand while the program is closed, or delete it to go back to the defaults. If the folder can't be written to, the program still runs but doesn't keep its settings.

Only one copy of the program runs at a time. Starting it again brings the open window to the front (restoring it if it's minimized). Dropping files or a folder on the program's icon while it's open hands them to the open window, which opens them as if they'd been dropped on the sprite sheet preview, asking first if the sheet has unsaved changes. If the open window is busy (extracting, loading or saving a GIF) or has Preferences, GIF Settings or a message open, the dropped files are ignored, but the window still comes to the front.

The program is unsigned, so Windows SmartScreen may warn the first time you run it. Click "More info", then "Run anyway".

## The window
The menus are at the top. The left side holds the settings, the results, the Save buttons and the animation preview settings. The right side shows the sprite sheet with the animation preview below it. You can make the window larger or maximize it, and the previews grow to use the space.

The window follows the display scale of the monitor it's on (100%, 125%, 150% and so on), and adjusts when you move it to a monitor with a different scale, the way Windows does: it keeps its size in Windows' scaled units, so it looks a little larger or smaller on screen. Preferences, the GIF Settings box, the expanded preview and the Readme and Release Notes windows do the same, each on their own.

The window can't be made smaller than its contents need, and grows on its own when they need more room (for example when warnings appear in the Result panel), up to the size of the screen. When it grows past the bottom of the screen it moves up to stay on it.

On a small screen (for example 1920 × 1080 at 100%), where the window's contents would need more height than the screen has, everything in the program's windows is drawn a little smaller, just enough to fit, down to about 80% of the normal size so the text stays readable. Past that, the left side scrolls. Nothing changes on screens that are big enough. The same size is used for every window, based on the screen the main window is on, and is worked out again when the main window moves to another screen or a window opens that needs more room.

## Visual Mode
**View > Visual Mode** switches between **Light**, **Dark** and **Use Windows Settings** (the default, which follows the "Choose your default app mode" setting in Windows' Personalization > Colors). The change applies straight away and is remembered.

With Use Windows Settings, a change in Windows is followed straight away.

Dark mode covers the program's own windows and menus, including their title bars on Windows 10 (2020 or later) and Windows 11. Windows' own boxes (Open, Save, folder and color pickers) keep Windows' look.

## Language
**View > Language** lists English and every language file found in the `Languages` folder, each by its own name (Deutsch, Español, Русский, മലയാളം, कोंकणी and so on). Goan Konkani is written in Devanagari and its file is `kok.ini`. Picking one changes all the program's windows straight away and is remembered. The first time the program runs, it uses Windows' display language if there's a file for it, and English otherwise.

The Readme and Release Notes are in English only. Windows' own boxes (Open, Save, folder and color pickers) follow Windows' language, not the program's. Some messages from Windows or the video decoder, such as why a file couldn't be opened, are passed on as they come. Names that Second Life scripts use, such as `llSetTextureAnim`, `LOOP` and `PING_PONG`, and the sheet file name format stay the same in every language.

### Making or correcting a language file
A language file is a plain text file saved as UTF-8 and named after the language's code, for example `de.ini` for German or `pt-BR.ini` for Brazilian Portuguese. Each line is `key = text`, with `\n` where a line break goes. Lines starting with `#` are notes. The easiest start is a copy of an existing file. Things to know:
- `language_name` is the name shown in the menu, written in that language.
- Words in braces, such as `{count}` or `{name}`, are filled in by the program. Keep them exactly as they are; they can move anywhere in the sentence.
- Entries that end in `.one`, `.few`, `.many` or `.other` are the same sentence for different numbers. Each language uses its own set of forms; English uses `.one` and `.other`, Polish and Russian use `.one`, `.few` and `.many`. If a form is missing, the `.other` form is used.
- Anything left out of the file is shown in English, so a file can be filled in a bit at a time.
- After saving the file, pick the language again in View > Language to see the changes.

## Tooltips
Resting the mouse on a button, box, dropdown or menu item for half a second shows a short explanation, including in Preferences, GIF Settings and the expanded preview. A grayed-out control or menu item also says why it's unavailable. Moving away, clicking or scrolling hides it. **View > Show Tooltips** turns them off or on; it's remembered.

## Making a sprite sheet
1. Open a file with **File > Open GIF or Video...** (Ctrl+O), by dropping it onto the sprite sheet preview, or by dropping it onto the program's icon. For an image sequence, use **File > Open Image Sequence...** (Ctrl+Shift+O) or drop the folder or its files (see Image sequences). The Source panel shows the size and the number of frames.
2. For a GIF or an image sequence, you can use **Use every Nth frame** to thin out a long animation.
   For a video, set **Start**, **End** and **Frames to take**, then click **Extract Frames** (Ctrl+E, also in the Edit menu). When a video is opened, frames are extracted automatically from the whole clip.
   If the picture is sideways, upside down or mirrored, use the rotate and flip buttons on the right of the GIF Frames, Sequence Frames or Video Clip panel (see Rotating and flipping).
   To take out frames that repeat, click **Remove Duplicates** in the same panel (see Removing duplicate frames).
3. In **Sheet Layout**, Automatic picks the number of columns and rows for you; Manual lets you type them. Set the **Edge padding** (see below), the texture size (512, 1024 or 2048) and the frame fit:
   - **Stretch** fills each cell with the frame.
   - **Keep aspect** keeps the picture's true proportions on the aspect ratio you choose in the animation preview, and fills the leftover space with **Bars**: either a solid **Color** (click the swatch to choose it; black to start) or **Transparent**.
   **Resize** chooses how frames are scaled to fit their cells: **Smooth** (the default) for videos and ordinary GIFs, or **Sharp** for pixel art, which keeps every pixel a crisp block. It also applies to Save GIF, and starts on Smooth each time the program opens.
4. Click any frame in the sheet preview to remove it; later frames move back to fill the gap. **Undo** (Ctrl+Z) brings back the last removed frame (or everything the last Remove Duplicates took out) and **Restore All** (Ctrl+Shift+Z) brings back all of them. Both are also in the Edit menu.
5. In the animation preview settings, choose the aspect ratio of the prim face the animation will play on (Landscape or Portrait, then a ratio), and the **FPS**. The play mode settings below them let you check how the sheet plays with different `llSetTextureAnim` settings (see Play modes). **Expand Preview** opens a larger, resizable preview window.
6. Click **Save Sprite Sheet** (Ctrl+S). For videos and image sequences you can also click **Save GIF...** (Ctrl+Shift+S), which first opens GIF Settings.

View > Show Grid Lines shows or hides the cell grid on the sheet preview. View > Preview picks the aspect ratio: 1:1 is at the top (it fits both orientations), and clicking the Landscape or Portrait heading switches the orientation, the same as the dropdown. Help > About shows the version.

## Using the sheet in Second Life
The saved file is named like `clip1k;4;4;12.5;14.png`: the source name with the texture size (512, 1k or 2k), then the columns, the rows, the FPS and the number of frames, separated by semicolons. Whole rates are written without decimals (`10`, not `10.0`), and any semicolon in the source name is changed to an underscore. This is the `name;columns;rows;fps` layout that common texture animation scripts read from the texture's name when it's dropped into a prim, so the sheet can be used with them without renaming; scripts that don't know about the frame count ignore it. To set the animation yourself, use those numbers in your script:

```
llSetTextureAnim(ANIM_ON | LOOP, ALL_SIDES, columns, rows, 0.0, frames, fps);
```

The number of frames is the last number in the file name and is also shown in the Result panel. If the grid has empty cells at the end, they're never shown as long as you pass the real frame count.

With **Keep aspect**, the sheet is made for the aspect ratio chosen in the preview, so put it on a face with that aspect ratio. With **Stretch**, the picture looks right on a face with the same proportions as the original.

## Edge padding
Second Life blends each pixel with its neighbors when it draws a texture, so at the edge of the face a thin, moving line of the neighboring frame can show in-world, especially up close. Edge padding replaces it with a steady line of one color: each frame is made a little smaller and surrounded by a border that's the same in every cell, so the blending at the edge only mixes that color with itself. The grid and the numbers for `llSetTextureAnim` don't change.

- **Stretch**: the border is black.
- **Keep aspect**: the border is the bar color, or transparent with Transparent bars. Only the sides where the picture reaches the edge of its cell get a border; the other sides already have bars.

Set it from 0 to 5 pixels in Sheet Layout; it starts at the default set in Preferences (0 to begin with). Second Life often shows a 2048 texture at half or a quarter of its size, which thins the border by the same amount, so use 2 or more for 2048 sheets (4 to be safe). On very small cells a large padding leaves little room for the picture, which the preview shows.

The bleed is more likely when the Result panel warns that the grid doesn't divide the texture evenly.

## Transparency
Empty cells at the end of the grid are filled with black. A sheet with no transparent pixels at all is saved without an alpha channel, so Second Life treats it as opaque. A sheet keeps its alpha channel when it has transparent bars or padding, or when the GIF itself has transparency; in-world, such a face may need its alpha mode set.

## FPS
The FPS box sets the playback speed of the preview, the rate in the saved file name and the timing of a saved GIF. When frames are loaded it's set to the suggested rate worked out from the file, and that suggested rate is listed first in the dropdown, above your presets, so you can go back to it after trying others. You can also type any rate.

Above 50 fps Save GIF is grayed out, because GIFs can't play that fast. GIF timing is stored in hundredths of a second, so only rates like 50, 33.3, 25, 20 and 16.7 play exactly; others are rounded (24 plays as 25).

If a GIF's frames have uneven timing, the Result panel says so: `llSetTextureAnim` plays every frame for the same time, so the average is used.

## Play modes
The animation preview can play the sheet the way `llSetTextureAnim` would with other settings, so you can check them before going in-world. They only affect the preview: the sheet, the saved file and Save GIF stay the same, and they start at their defaults each time the program opens.
- **Loop** (ticked to start): plays over and over, like `LOOP`. Unticked, the preview plays once and pauses on the last frame shown.
- **Reverse**: plays backwards, like `REVERSE`.
- **Ping-pong**: plays forwards then backwards, like `PING_PONG`, without showing the end frames twice. With Loop unticked, it finishes on the first frame. Reverse and Ping-pong can be used together.
- **Start** and **Length**: which cells play, matching the start and length values in your script. Start counts from 0, like the script does, so the first cell is 0. They start out covering every frame. Cells after the last frame are black, and the preview shows them if Length reaches them, just as Second Life would.

Below them are the playback buttons and the Cell field:
- **Pause / Play**: pauses the preview on the frame showing, and plays on from there. When a preview with Loop unticked has finished, Play starts it again from the beginning.
- **Step back** and **Step forward** (either side of Pause / Play): show the previous or next frame in the order the preview plays them, following Start/Length, Reverse and Ping-pong, and wrapping round at the ends. Clicking one while the preview is playing pauses it on the next frame.
- **Replay** (circular arrow): starts the preview again from the beginning and plays it.
- **Cell**: the cell on screen, counting from 0 like Start. Type a cell number and press Enter to pause on that cell; a number outside Start/Length is moved to the nearest cell in the range. Escape puts the number back.
- While paused, the mouse wheel over the preview steps through the frames: down for the next frame, up for the previous one.
- Changing a play mode or Start/Length while paused goes back to the start of the sequence and stays paused.

The buttons, Cell field and mouse wheel do the same in the main window and the expanded preview, and pausing in one pauses the other. Opening a file, extracting frames or opening the expanded preview starts playing again.

The script line for these settings looks like this, with the mode flags added together:

```
llSetTextureAnim(ANIM_ON | LOOP | PING_PONG, ALL_SIDES, columns, rows, start, length, fps);
```

When frames are removed or added back, or the grid changes, a range that covers every frame keeps doing so. Any other range is kept, trimmed if it no longer fits the grid. Opening a file or extracting frames resets it to every frame.

## Expand Preview
Opens a separate window playing the animation at the chosen aspect ratio and FPS. It can be resized by dragging, and its height snaps back to the aspect ratio. The bar at the bottom has the same playback buttons, Cell field, orientation, FPS, ratio and play mode controls as the main window, and changes in either place apply to both. The small preview pauses while it's open.

Let go of the expanded preview close to an edge of the main window (within about 20 pixels) and it snaps against that edge with no gap, lining up with the main window's top or bottom (or left or right) edge when it's close to that too. While snapped, it moves along when you move or resize the main window, comes to the front with it (from Alt+Tab, the taskbar or a click), and is hidden while the main window is minimized and comes back with it. It has no taskbar button of its own while snapped. Drag it away to separate it. Maximizing the main window also separates it.

## Cropping
**Crop...** (beside Extract Frames for video, and at the top of the GIF Frames and Sequence Frames panels) opens the Crop window, where you choose the part of the picture that goes on the sheet. It works for videos, animated GIFs, WebPs and PNGs, and image sequences.

The window shows one frame, with the parts outside the crop shaded. The slider below it moves through the clip between Start and End, or through the frames, so you can check the crop fits the whole animation. At the very end of a clip it shows the last frame.

- **Orientation** and **Ratio** keep the crop to an aspect ratio, such as 1:1 or 16:9. The crop starts as the largest centered 1:1 square that fits (see Include bars below).
- With **Freehand** off, drag inside the crop to move it, and drag a corner to resize it; it keeps its ratio. The Width and Height boxes step in whole ratio steps (at 16:9, 16 pixels wide and 9 high), so the crop stays exactly that ratio in pixels.
- With **Freehand** on, drag the handles on the edges and corners to give the crop any shape. Turning Freehand off again snaps the crop to the closest ratio, keeping its center.
- **X**, **Y**, **Width** and **Height** set the crop in pixels; the mouse wheel works on them too. **Reset** goes back to the starting square.
- **Include bars** lets the crop go past the picture's edges, up to where the whole picture fits inside it, so an upright phone video can become a square with bars at the sides. The extra part is filled like the bars: in the bar color, or transparent, as set under **Bars** in the main window, and it follows that setting even with Stretch. It's ticked when the window opens if Frame fit is Keep aspect. With it ticked, the crop starts as the largest crop of the ratio that holds the whole picture. Unticking it brings the crop back inside the picture. A Freehand crop can go out as far as a square the size of the picture's long side.

The Crop window doesn't lock the main window: you can keep working there while it's open. Changing Start or End updates the slider straight away, and changing Bars or the bar color updates the frame view. Opening another file or closing the file closes the Crop window without applying anything. Extracting frames while it's open uses the crop already applied; OK is grayed out while the program is busy.

The Crop window can be resized by dragging its edges; the frame view grows with it. Like the expanded preview, it snaps against an edge of the main window or the expanded preview when you let go of it close to one, follows that window while snapped, and comes loose when you drag it away. It's hidden while the main window is minimized and comes back with it. It reopens at its last size and position (snapped again if it was snapped), or centered on a monitor chosen in Preferences.

The crop is made before frames are scaled down, so it keeps all the detail there is. The Source panel shows the cropped size. Rotating and flipping turn the cropped frames. Extracting frames again keeps the crop; opening another file starts without one. Changing the crop counts as a change to the sprite sheet.

## Rotating and flipping
The four buttons on the right of the GIF Frames and Video Clip panels turn every frame:
- **Rotate left** and **Rotate right**: a quarter turn counterclockwise or clockwise.
- **Flip horizontally**: swaps left and right, like a mirror. Useful for webcam or selfie footage that was recorded mirrored, or to make a character face the other way.
- **Flip vertically**: swaps top and bottom (not the same as turning it upside down, which is two quarter turns).

Each frame is turned in place, so the frames stay in the same order on the sheet. The text under the buttons shows the result, for example "90°" or "90°, flipped horizontally" (flipped first, then turned). Pressing the same flip twice, or rotating four times, puts it back.

Automatic layout picks a new grid for the new shape, and Save GIF uses the turned frames. Removed frames stay removed. Extracting frames again from the same video keeps the rotation; opening another file starts with none. Rotating or flipping counts as a change to the sprite sheet.

## Removing duplicate frames
Every repeated frame wastes a cell on the sheet. **Remove Duplicates** in the GIF Frames and Video Clip panels takes out each frame that looks the same as the frame kept before it. The removed frames count as ordinary removals: the Result panel counts them under "Removed frames", **Undo** puts back everything one Remove Duplicates took out, and **Restore All** puts back every removed frame.

**Similarity** sets how alike two frames must be, from 50% to 100%. At 100% (the default) only exact copies are removed. Videos rarely have exact copies, because compression changes each frame a little, so for a video try 98% or 99%. Lower settings start removing frames that really do differ.

`llSetTextureAnim` plays every cell for the same time, so a frame that was shown for longer can't keep its extra time on a sheet. **Keep the loop's length** (ticked when the program starts) lowers the suggested rate so the loop takes as long as before. Unticked, the rate stays the same and the loop gets shorter. Changing it afterwards updates the suggested rate straight away.

The Result panel says what was found:
- **Evenly repeated:** every frame was repeated about the same number of times, for example a 12 fps cartoon saved as a 30 fps video. With Keep the loop's length ticked, the animation looks exactly the same in fewer cells.
- **Pauses:** the picture held still here and there. Because the rate is constant, the pauses get shorter.

For a video with evenly repeated frames, the Result panel also says how often the clip really changes and how much of the clip Frames to take would cover at that rate. You can then set End or Frames to take and extract again to fill the sheet with more of the clip. Extracting again puts the removed frames back, so click Remove Duplicates again afterwards.

Similarity and Keep the loop's length start at 100% and ticked each time the program opens.

## Video
Common video formats work, including MP4, MOV, M4V, WebM, AVI, MKV, WMV, MPG, FLV and 3GP. Sound is ignored. Phone videos filmed sideways are turned upright.

Frames are taken at evenly spaced times between Start and End. When they're far apart, for example a few frames from a long clip, the program jumps ahead to each one instead of reading the whole clip, so extraction finishes sooner. The frames picked are the same either way. Frames to take can't be more than the grid size limit squared (64 with the standard 8 × 8 limit).

The bar under Extract Frames shows how far extraction has got.

To save memory, frames are stored at a reduced size when many are taken (see "Limit frame size to save memory" in Preferences). If Windows runs out of memory anyway, extraction stops with a message suggesting fewer frames or a smaller frame size.

## Image sequences
An image sequence is a set of pictures that are the frames of one animation, numbered in their names: `walk_01.png`, `walk_02.png` and so on, or `walk1.png` to `walk12.png`. PNG, JPG, BMP, TGA and WebP files work.

There are three ways to open one:
- **File > Open Image Sequence...** (Ctrl+Shift+O) and choose the folder the pictures are in.
- Drop the folder onto the sprite sheet preview, or onto the program's icon.
- Select the pictures in File Explorer and drop them onto the sprite sheet preview. They must all belong to the same sequence. (Dropping a single picture opens just that picture, as before.)

The frames play in the order of their numbers, so `walk_2` comes before `walk_10` even without leading zeros. Frames belong to the same sequence when the name before the number and the file type are the same (capital letters don't matter). In a folder, other files are ignored, and so are pictures with no number at the end of their name.

- If a folder holds more than one sequence, the program lists them and asks which one to open.
- If numbers are missing (for example frame 7 of 12), the program lists them and asks whether to open the sequence anyway. If you do, the missing numbers are also shown in the Result panel.
- All frames must be the same size. If one isn't, the sequence isn't opened and the message names the first frame that differs.
- Dropped files that don't have a number at the end of their name, aren't one of the file types above, or come from different sequences aren't opened.

A sequence starts at 10 FPS; you can change that in Preferences. Large pictures are scaled down the same way as video frames (see "Max frame size" and "Limit frame size to save memory" in Preferences). The bar in the Sequence Frames panel shows how far loading has got. Saving the sheet suggests the sequence's name without the number, for example `walk1k;4;4;10;16.png`.

## Saving a GIF
Save GIF opens **GIF Settings**, then asks where to save:
- **GIF width** in pixels (it remembers the last value).
- **Reverse**: the GIF plays backwards.
- **Ping-pong**: the GIF plays forwards then backwards, without showing the end frames twice, so the loop has no pause. Combined with Reverse it starts from the last frame.
- **Play once**: the GIF plays a single time instead of looping forever. With Ping-pong, it finishes on the frame it started on.

The checkboxes are separate from the preview's play modes, start unticked each time the program opens, and stay as you left them while it's open. The GIF uses one shared set of 256 colors for all frames, so colors don't flicker between frames.

## Preferences
**File > Preferences...** (Ctrl+P) sets the program's defaults. OK saves them; Cancel discards your changes. FPS presets, the video and image sequence settings, the GIF width, the grid size limit and the folder settings apply straight away. The rest apply the next time the program starts, so they don't change what's on screen.
- **Sprite Sheet**: texture size, Automatic or Manual layout, manual columns and rows, the default edge padding (0 to 5 pixels), and the grid size limit ("Limit columns and rows to" 8, 16, 32 or 64; untick it to allow up to 255).
- **Frames**: frame fit, bars and bar color.
- **Animation Preview**: orientation, aspect ratio, grid lines and the FPS presets (a comma-separated list).
- **Video and Image Sequences**: frames to take (videos), the largest frame size, the default GIF width, the FPS image sequences start with, and "Limit frame size to save memory". The frame size settings apply to videos and image sequences.
- **Windows**: where the main window, the expanded preview and the Crop window open: their last position, or centered on a chosen monitor. **Identify Monitors** shows each monitor's number on its screen for 2 seconds.
- **Folders**: whether Open and Save start in a default folder, and which folder (set it with **Browse...**).

## Folders
With "Use default folder" ticked, Open and Save start in that folder. Otherwise they start in the last folder you opened a file from or saved to, or on the Desktop the first time. If the default folder is missing (deleted, renamed or on a disconnected drive), the program tells you once and uses the last folder instead.

Desktop, Documents, Downloads, Pictures, Videos and Music are shown and stored by name (for example `Documents\SL Textures`), so they keep working if Windows moves those folders.

## Closing a file
**File > Close Current File** (Ctrl+W) unloads the current file: the sheet preview shows the drop hint again, the animation preview goes blank, and the expanded preview closes. Your Sheet Layout, aspect ratio and play mode settings stay as they are.

## Unsaved changes
If the sprite sheet has changed since you last saved it, opening another file, closing the current file or closing the program asks whether to save it first (Save, Don't Save or Cancel). Extracting frames again counts as a change when the new sheet differs from the one you last saved or opened.

## Readme and Release Notes windows
Help > Readme (F1) and Help > Release Notes each open in their own window over the main window, with a table of contents at the top. Click an entry to jump to that section, and "Back to contents" at the end of each section to return. The windows can stay open while you work.

## Keyboard shortcuts
These work from the main window, the expanded preview and the Readme and Release Notes windows. They're also shown beside their items in the menus.
- **Ctrl+O**: open a GIF or video.
- **Ctrl+Shift+O**: open an image sequence.
- **Ctrl+S**: save the sprite sheet.
- **Ctrl+Shift+S**: save a GIF (videos and image sequences only).
- **Ctrl+W**: close the current file (asks first if the sprite sheet has unsaved changes).
- **Ctrl+P**: Preferences.
- **Ctrl+Q**: exit (asks first if the sprite sheet has unsaved changes).
- **Ctrl+E**: extract frames (videos only).
- **Ctrl+Z**: undo the last removed frame.
- **Ctrl+Shift+Z**: restore all removed frames.
- **F1**: open this Readme.

These work from the main window and the expanded preview, except while typing in a box (such as Start, Length or Cell):
- **Space**: pause or play the preview.
- **Left arrow** and **Right arrow**: step back or forward one frame.
