# Sprite Sheet Maker — Release Notes

## v0.19.3 (Rust)
- The aspect ratio is now chosen from a dropdown beside the orientation dropdown, in the main window's Animation Preview panel and in the expanded preview, instead of a row of buttons. FPS follows them on the same row.
- The expanded preview's controls wrap onto more rows when the window is made narrow, so none are cut off at the right edge. The window can't be made narrower than its widest group of controls.
- The Crop window can be made much smaller: the frame view's smallest size went from 720 × 480 to 360 × 240, and the Orientation and Ratio dropdowns are only as wide as their choices.

## v0.19.2 (Rust)
- Small screens: when a window's contents need more room than the screen has (the main window on a 1920 × 1080 screen at 100% with a file loaded went past the bottom of the screen), all the program's windows are drawn smaller by just enough to fit, down to about 80%; past that the left side scrolls. The main window also moves up when it grows past the bottom of the screen, and a remembered window size that no longer fits the screen is made smaller. Nothing changes on screens that are big enough.
- The Crop window no longer locks the main window. Changing Start or End updates its slider, and changing Bars or the bar color updates its frame view, straight away. Opening another file or closing the file closes it without applying anything. OK is grayed out while the program is busy.
- The Crop window can be resized (the frame view grows with it), snaps to the main window or the expanded preview like the expanded preview does, and reopens at its last size and position, snapped again if it was snapped.
- Preferences has a new **Crop window opens** choice: its last position, or centered on a monitor.
- Two new entries were added to the language files, with draft translations.

## v0.19.1 (Rust)
- **Include bars** in the Crop window lets the crop go past the picture's edges, up to where the whole picture fits inside it (for a Freehand crop, up to a square the size of the picture's long side). The extra part is filled in the bar color or left transparent, following Bars in the main window, and changes with that setting without extracting again. The frame view shows that area in the bar color, or as a checkerboard for transparent bars. It's ticked when the window opens if Frame fit is Keep aspect, and the crop then starts as the largest crop of the ratio that holds the whole picture.
- Fixed: moving the Crop window's time slider to the end of a video showed "No frames were found in that range". It now shows the last frame.
- Two new entries were added to the language files, with draft translations.

## v0.19.0 (Rust)
- **Crop**: a new **Crop...** button opens a Crop window for videos, animated images and image sequences. It shows a frame with a slider to move through the clip or the frames, and a crop frame you can move and resize. The crop keeps an aspect ratio (Orientation and Ratio, 1:1 to start) or, with **Freehand**, takes any shape; turning Freehand off snaps it to the closest ratio. X, Y, Width and Height boxes and a Reset button are included. See "Cropping" in the Readme.
- The crop is made before frames are scaled down, so detail is kept. The Source panel shows the cropped size. The crop stays when frames are extracted again and is cleared when another file is opened. Changing it counts as an unsaved change.
- Preferences, GIF Settings and messages now show the program's icon in their title bar, like the other windows.
- 29 new entries were added to the language files, with draft translations.

## v0.18.2 (Rust)
- The program has its own icon: a grid of frames with a play button. It shows on the .exe in Explorer, on shortcuts, on the taskbar, in Alt+Tab and in the title bars of the main window, the expanded preview and the Readme and Release Notes windows, at the right size for each monitor's scaling. It replaces egui's default logo.
- Preferences, GIF Settings and messages no longer show an icon in their title bar, like Windows' own dialog boxes.
- The English text now uses American spelling (color, centered, grayed, minimized and so on), in the program and in the Readme and Release Notes.

## v0.18.1 (Rust)
- Only one copy of the program runs at a time. Dropping files or a folder on the program's icon while it's open no longer starts a second copy: the open window opens them instead (asking first about unsaved changes) and comes to the front. Starting the program again with nothing dropped just brings the open window forward, restoring it if it was minimized.
- While the open window is busy, or has Preferences, GIF Settings or a message open, files dropped on the icon are ignored; the window still comes to the front.

## v0.18.0 (Rust)
- **Image sequences**: a folder of numbered pictures (PNG, JPG, BMP, TGA or WebP) can now be opened as the frames of one animation, with **File > Open Image Sequence...** (Ctrl+Shift+O), by dropping the folder or its files onto the sprite sheet preview, or by dropping the folder onto the program's icon. Frames play in number order, so `walk_2` comes before `walk_10`.
- A folder with more than one sequence asks which one to open. Missing numbers ask whether to open the sequence anyway, and are listed in the Result panel if you do. Frames of different sizes, dropped files without a number, and files from different sequences are refused with a message saying why.
- Image sequences have a Sequence Frames panel with Use every Nth frame, Remove Duplicates, rotate and flip, and a progress bar for loading. Save GIF works with them.
- Sequences start at 10 FPS. Preferences has a new **Image sequence FPS** setting to change that, and the Video box is now called **Video and Image Sequences**: its max frame size and memory limit settings apply to image sequences too.
- The pictures of a sequence are read on all processor cores at once.
- The drop hint and some messages now mention image sequences. 24 new entries were added to the language files and 10 were reworded, with draft translations.

## v0.17.3 (Rust)
- Messages (About, errors, warnings and the unsaved-changes question) are now drawn by the program instead of Windows, so they follow Light and Dark, including their title bar, and use the program's language. They still play Windows' message sounds. Enter presses the highlighted button and Escape closes the message.
- The unsaved-changes question now has **Save**, **Don't Save** and **Cancel** buttons instead of Yes, No and Cancel. Two new entries were added to the language files for them (`button.save`, `button.dont_save`), with draft translations.

## v0.17.2 (Rust)
- Fixed: the FPS box was still a little too narrow, so the last digit of a rate like 18.82 was cut in half. It now fits rates up to three digits with two decimals.

## v0.17.1 (Rust)
- The left side of the window is only as wide as its contents need, as in v0.13.1, instead of a fixed width. The Source and Result text wraps at that width.
- Save Sprite Sheet and Save GIF... are as wide as the longer of the two labels, and Extract Frames, Remove Duplicates and Expand Preview as wide as their own, instead of filling the panel. The Texture size and Resize dropdowns are as wide as their longest choice.
- The FPS box is wider, so rates with two decimals (such as 18.82) are no longer cut off.
- Extracting frames again no longer counts as a fresh start for the unsaved-changes question. If the new sheet differs from the one last saved or opened (including a different Start, End or Frames to take), opening another file, closing the file or closing the program asks first. Extracting again with the same settings doesn't. Use every Nth frame is also part of the check.

## v0.17.0 (Rust)
- The last stage of the rewrite: everything v0.13.1 had is back.
- **File > Preferences...** (Ctrl+P) is back, in its own window that you can move to another monitor. It's centered over the main window, and the main window can't be used while it's open.
- **Monitors**: the main window and the expanded preview again open at their last position or centered on a monitor chosen in Preferences, and **Identify Monitors** shows each monitor's number. The main window remembers its size, position and whether it was maximized. When a window moves to a monitor with a different display scale, it keeps Windows' own behavior: it keeps its size in Windows' scaled units, so it looks a little smaller or larger on screen.
- The main window again can't be made smaller than its contents, and grows when they do (for example when Result warnings appear), up to the size of the screen. The left side still scrolls if the screen is too small for it.
- **View > Visual Mode** is back. The menu bar and menus now follow Light and Dark too, and Use Windows Settings follows a change in Windows straight away instead of after a restart.
- **View > Language** and the language files are back. Malayalam and Konkani letters use Windows' Nirmala UI font.
- **Tooltips** are back, with View > Show Tooltips. Menu items now have tooltips too, and grayed-out menu items say why they're unavailable. Fifteen new entries were added to the language files for these (`tip.m_...`, `off.video_only`, `off.nothing_removed`), with draft translations.
- **Help > Readme** (F1), **Release Notes** and **About** are back. Bold text in the Readme window uses Windows' Segoe UI Bold font.
- **Rotate and flip**, **Remove Duplicates** (with Similarity and Keep the loop's length), **Save GIF** (Ctrl+Shift+S) with GIF Settings, **File > Close Current File** (Ctrl+W) and the question about unsaved changes are back. Dropping a file on the program's icon opens it again.
- Save GIF now picks its 256 colors with a different method from v0.13.1. The result looks the same, but the dithering grain and the exact shades aren't pixel for pixel the same as v0.13.1's GIFs.
- The menus are grayed out as in v0.13.1 while nothing is loaded or a background job runs.
- settings.ini no longer has a `geometry_units` entry.

## v0.16.0 (Rust)
- The previews are back. The sheet preview has its checkerboard background and View > Show Grid Lines, and clicking a frame removes it, with Undo and Restore All beside the preview and in the Edit menu (Ctrl+Z, Ctrl+Shift+Z).
- The animation preview is back with Landscape/Portrait and the ratio buttons (also in View > Preview), the FPS box, Loop, Reverse, Ping-pong, Start and Length, the playback buttons, the Cell field, the mouse wheel while paused, and Space, Left and Right.
- Expand Preview is back. It keeps the aspect ratio when resized, snaps to the main window's edges and follows it while snapped.
- The sheet's file name and the 50 fps warning now follow the FPS box instead of the suggested rate.
- "Face shape" is now called "Aspect ratio" everywhere: on screen, in settings.ini (`aspect_ratio`) and in the language files (`pref.aspect`, `tip.aspect`, `tip.p_aspect`, with the wording of the draft translations updated). A face shape saved by an earlier version isn't carried over, so the preview starts at 1:1 the first time.
- The Cancel button beside the extraction progress bar is gone, and the bar is full width again. Closing the program still stops a running extraction.
- Files are only opened when dropped on the sheet preview, as in v0.13.1; dropping them elsewhere on the window does nothing.
- Fixed: in MPG videos with Start above 0, the first frame could come out a frame or two late. In some MPG files, a Start near the end also stopped extraction with "Invalid data found when processing input". Both happened in v0.13.1 too.
- The animation previews let the graphics card scale each frame instead of resizing it for every window size, which uses less CPU and memory. They look the same, but aren't pixel for pixel the same as v0.13.1's previews. The saved sheet is not affected.
- The left side of the window scrolls when it doesn't fit, until the window sizing from v0.13.1 returns.

## v0.15.0 (Rust)
- Video is back: open MP4, MOV, M4V, WebM, AVI, MKV, WMV, MPG, FLV and 3GP clips by menu or by dropping them on the window. The Video Clip panel (Start, End, Frames to take, Extract Frames) and Edit > Extract Frames (Ctrl+E) work as in v0.13.1. Frames are extracted straight away when a video is opened, phone videos are turned upright, and frames come out pixel for pixel the same as v0.13.1's.
- Cancel beside the progress bar stops an extraction.
- The video decoder is built into the .exe, so it's still a single file. The .exe is now about 19 MB.
- The video settings in Preferences (frames to take, max frame size, Limit frame size to save memory) are used, but can only be changed in v0.13.1 until Preferences returns.
- Opening a video clears the previous file's sheet straight away instead of showing it until the new frames are ready.

## v0.14.0 (Rust)
- First version of the program rewritten in Rust (v0.13.1 and earlier were Python): a much smaller .exe (under 6 MB for now instead of 44 MB; it grows when video support returns) that starts straight away. It's being brought up to the features of v0.13.1 in stages; this first stage covers opening animated GIF, WebP and PNG files (File > Open, or drop a file anywhere on the window), the Sheet Layout panel, Use every Nth frame, the Result panel and Save Sprite Sheet. Video, the animation previews and play modes, the expanded preview, Preferences, languages, tooltips, rotate and flip, Remove Duplicates, Save GIF, Close Current File, the unsaved-changes question and the Readme and Release Notes windows follow in the next versions; v0.13.1 still has them in the meantime.
- Sprite sheets come out pixel for pixel the same as v0.13.1's for the same file and settings, with the same layout, suggested rate and file name.
- Until the animation preview returns, the sheet's file name uses the suggested rate, and Keep aspect uses the face shape set in Preferences.
- Number boxes now have a − button on the left and a + button on the right. You can still type a value, drag it or use the mouse wheel over it.
- The menus and controls are drawn by the program itself instead of Windows, so they look a little different. The Open, Save and color boxes are still Windows' own.
- settings.ini is shared with v0.13.1: the same file works in both.

## v0.13.1
- Draft translations for മലയാളം (Malayalam) and कोंकणी (Goan Konkani, in Devanagari).
- Show Grid Lines now only redraws the lines instead of rebuilding the whole sheet.
- In Stretch mode, changing the face shape no longer rebuilds the sheet or counts as an unsaved change, since the sheet doesn't depend on it. In Keep aspect it still does.
- Switching language, changing display scale and ticking Keep the loop's length update the window without rebuilding the sheet.
- The sheet preview's checkerboard background is made once and reused, and the animation previews swap the picture in place instead of redrawing it, using less CPU while playing.
- Tidied unused code.

## v0.13.0
- Remove Duplicates in the GIF Frames and Video Clip panels takes out frames that look the same as the frame kept before them. Similarity (50–100%, 100% to start) sets how alike they must be; 100% removes only exact copies.
- Keep the loop's length (ticked to start) lowers the suggested rate so the loop lasts as long as before; unticked, the rate stays and the loop gets shorter.
- The Result panel says whether the duplicates were evenly repeated or pauses, and for videos how often the clip really changes and how much of it Frames to take would cover at that rate.
- Undo puts back everything one Remove Duplicates took out in one step.
- The Result panel's "Removed by clicking" is now "Removed frames", since it also counts duplicates.

## v0.12.0
- View > Language: the program can be shown in other languages, read from files in a `Languages` folder beside the program. Draft translations for Nederlands, Deutsch, Italiano, Español, Polski and Русский are included. The change applies straight away and is remembered; the first time, Windows' display language is used if there's a file for it. Anything a language file leaves out is shown in English.
- Tooltips on buttons, boxes and dropdowns in the main window, the expanded preview, Preferences and GIF Settings. Grayed-out controls say why they're unavailable. View > Show Tooltips turns them off.
- The Source and Result panels now give counts as labels ("Frames: 64", "Columns: 8, rows: 8"), which read correctly in every language.
- Preferences: the grid size limit now reads "Limit columns and rows to" followed by the number.
- Panels, dropdowns and the expanded preview's bottom bar widen to fit longer text.
- Fixed: after opening a file or rotating, the Landscape/Portrait dropdown showed the rotation text (such as "No rotation"), and the text under the rotate buttons showed "Landscape". Rotating could also switch a portrait face shape to landscape.

## v0.11.0
- Rotate left, Rotate right, Flip horizontally and Flip vertically buttons in the GIF Frames and Video Clip panels. They turn every frame in place, so the play order is kept, and the text under them shows the result. Automatic layout follows the new shape, Save GIF uses the turned frames, and removed frames stay removed. The rotation is kept when frames are extracted again and resets when another file is opened.

## v0.10.1
- The expanded preview's playback buttons and Cell field are now on its bottom row, to the right of Length, leaving more room for the picture.
- A snapped expanded preview follows the main window smoothly, without the flicker and jerky movement.
- A snapped expanded preview now comes to the front with the main window (Alt+Tab, the taskbar or a click) instead of staying behind other programs. It has no taskbar button of its own while snapped.

## v0.10.0
- Playback buttons in both animation previews: Step back, Pause / Play, Step forward and Replay (now an icon instead of the word). Pausing in one preview pauses the other.
- Cell field beside the buttons showing the cell on screen; type a cell number and press Enter to pause on it.
- While paused, the mouse wheel over a preview steps one frame per notch.
- Keyboard: Space pauses or plays, Left and Right arrows step one frame, except while typing in a box.
- With Loop unticked, the preview now pauses on its last frame, and Play starts it again.
- The expanded preview snaps against the main window when let go within about 20 pixels of it, then follows it when the main window is moved or resized, and is hidden while it's minimized. Dragging it away or maximizing the main window separates it.

## v0.9.3
- Sprite sheets are now named like `clip2k;8;8;10;57.png`: source name and texture size (512, 1k or 2k), then columns, rows, FPS and frame count, separated by semicolons. This matches the name layout common texture animation scripts read, so sheets work with them without renaming. Whole rates are written without ".0", and semicolons in the source name become underscores.

## v0.9.2
- Faster extraction from long clips: when the wanted frames are far apart, the program jumps ahead to each one instead of reading every frame in between. It picks exactly the same frames as before. In tests on a 3-minute 1080p clip, 16 frames took about 2 seconds instead of 11, and 64 frames about 8 instead of 15.

## v0.9.1
- File > Close Current File (Ctrl+W): unloads the file, clears both previews and closes the expanded preview, asking first if the sprite sheet has unsaved changes.
- The Save Sprite Sheet button is now grayed out until there is a sheet, like its menu item.

## v0.9.0
- Play modes in the animation preview: Loop, Reverse, Ping-pong, and Start/Length to play a range of cells (Start counts from 0, like the script), plus a Replay button. The same controls are in the expanded preview. They only affect the preview.
- GIF Options is now GIF Settings, with Reverse, Ping-pong and Play once checkboxes beside the GIF width. They start unticked at every launch.

## v0.8.9
- Edge padding is now a solid border instead of repeated edge pixels, which didn't stop the neighboring frame showing at the face edge in-world. The border is black in Stretch, and the bar color (or transparent) in Keep aspect.

## v0.8.8
- Edge padding (0 to 5 px) in Sheet Layout: shrinks each frame and repeats its outer pixels around it, so neighboring frames don't bleed into each other in-world. The starting value is set in Preferences (default 0). With Keep aspect, only the sides where the picture reaches the cell edge are padded.
- Resize dropdown in Sheet Layout: Smooth (default, as before) or Sharp for pixel art. Applies to the sprite sheet and Save GIF, and starts on Smooth at every launch.
- Columns and Rows now share one line, in the main window and in Preferences.
- Empty cells are filled with black instead of left transparent.
- Sheets with no transparent pixels are saved without an alpha channel, so Second Life treats them as opaque.
- The uneven-grid warning now mentions edge padding when it's off.

## v0.8.7
- View > Visual Mode: Light, Dark or Use Windows Settings (default), applied at once and remembered in settings.ini. Dark mode includes dark title bars.
- View > Preview: 1:1 moved to the top, since it belongs to both orientations.
- Fixed radio button and checkbox text being cut off when the main window or Preferences first opens on a monitor scaled higher than the primary.

## v0.8.6
- View > Preview: the Landscape and Portrait headings are no longer bold and now switch the orientation when clicked, with the dropdown following.
- Extract Frames added to the top of the Edit menu.
- New keyboard shortcuts, shown in the menus: Ctrl+E (Extract Frames), Ctrl+P (Preferences), Ctrl+Q (Exit), Ctrl+Shift+Z (Restore All Frames) and F1 (Readme). All shortcuts now also work from the expanded preview and the Readme/Release Notes windows.
- The Readme and Release Notes windows now always open over the main window instead of where they were last closed.
- Readme: new Keyboard shortcuts section.

## v0.8.5
- Help > Readme and Help > Release Notes now open in the program's own windows, with a clickable table of contents, "Back to contents" links and a scroll bar when needed. Each window follows its own monitor's scale and remembers its position and size.
- The Readme is now a user guide. The design notes and build instructions moved to a new file, SpriteSheetMaker_Architecture.md, which now has step-by-step Windows build instructions.

## v0.8.4
- Removed the flicker when Preferences or GIF Options moves to a monitor with a different scale: the rescale is back to one redraw, with the new contents built before the old ones are removed.

## v0.8.3
- Fixed Preferences and GIF Options keeping the wrong size (cut off, or with extra space) after being moved between monitors several times, especially with a file loaded.
- Windows now wait until the mouse button is released before rescaling for a new monitor.
- View > Preview Face renamed to Preview; its Landscape and Portrait headings are now bold instead of grayed out, with a double separator under each.

## v0.8.2
- Preferences and GIF Options now follow the scale of the monitor they're on, independently of the main window, and rescale when moved to a monitor with a different scale (keeping any unsaved entries).

## v0.8.1
- Fixed radio button and checkbox text being cut off on a monitor scaled higher than the primary (e.g. 150% beside 125%), in the main window and Preferences.
- Bars row now reads Color, swatch, Transparent in both the main window and Preferences.
- The suggested FPS for the loaded file is pinned to the top of the FPS dropdowns, above the presets.
- Default folder from an older settings.ini no longer shows as a full path; the Preferences label is worked out from the real folder.
- Last folder used is now stored as a short form (e.g. `Desktop`, `Pictures\Sprites`) instead of a full path; old full paths are converted when read.

## v0.8.0
- Default folder is shown as a short name for Windows special folders (Desktop, Documents, Downloads, Pictures, Videos, Music), e.g. "Documents\SL Textures"; other folders show their full path. The field is now set with Browse only. Special folders are found through Windows, so OneDrive-moved folders work.
- A message appears (once per session) when the default folder isn't available.
- Grid size limit in Preferences: "Limit to" 8/16/32/64 columns and rows (on, 8 by default); without the limit, up to 255 × 255. Frames to take is capped to match.
- Optional memory limit (on by default): when many video frames are taken they're stored smaller, never below their sheet cells or the GIF width. Out-of-memory during extraction now shows a message instead of failing.
- Asks to save first when opening another file or closing with unsaved changes to the sheet.
- Source panel shows a video's frame count.

## v0.7.0
- Per-monitor display scaling: text and previews are now sharp at 125%/150% scale instead of being stretched by Windows; all sizes follow the monitor's scale at start-up.
- The main window and the Expand Preview window each rescale on their own when moved onto a monitor with a different scale, keeping the same physical size.
- Monitor resolutions are now reported correctly (they were scaled down before), and the Preferences monitor list shows each monitor's scale.
- Saved window sizes are now stored independently of scale; sizes saved by earlier versions are converted once.

## v0.6.0
- settings.ini beside the program (created on first run) and File > Preferences... for startup defaults: sheet, frames, preview, video, GIF, monitors and folders.
- Main window and expanded preview remember position and size (main window also maximized state); optional fixed monitor for each, with Identify Monitors.
- Default folder option (off by default, Desktop to start); otherwise dialogs start in the last folder used.
- Main window can be enlarged; the previews grow to fill it (sheet two-thirds, animation one-third). Current size is the minimum.
- Help > Readme and Help > Release Notes open those files from the program folder.

## v0.5.0
- Face Shape panel renamed "Animation Preview (as played in SL)"; header above the right-side preview removed and the preview resized to 420 × 220 so the window fits a 1366 × 768 screen. Left-side spacing tightened.
- New FPS dropdown (presets or typed) on the same line as Landscape/Portrait; drives preview speed, PNG file name rate and GIF timing. Save GIF grayed out above 50 fps.
- Expand Preview button: separate resizable window in the face shape, with orientation, FPS and ratio controls in its bottom bar; the small preview pauses while it's open.

## v0.4.0
- Keep aspect now fits the bars to the chosen Face Shape, so the picture keeps its true proportions on that face; the saved PNG follows the face shape.
- Save area: header removed, "Save Sprite Sheet" and "Save GIF..." side by side (Save GIF grayed out for GIF sources).
- GIF width moved into a small options box shown before the GIF save dialog.
- Face Shape panel moved to the left under the save buttons; animation preview now uses the full right-side width (up to 406 × 300).

## v0.3.2
- Menus: File (Open, Save PNG, Save GIF, Exit), Edit (Undo Remove, Restore All Frames), View (Show Grid Lines, Preview Face), Help (About), with Ctrl+O / Ctrl+S / Ctrl+Shift+S / Ctrl+Z.
- Drag and drop a GIF or video onto the sprite sheet preview to open it.
- Removed: Open button, Show Grid Lines checkbox, status line, "Sprite Sheet Preview" header. Messages moved to pop-ups, the progress bar/busy cursor and the Result warnings.
- Sheet preview moved up; Undo and Restore All moved beneath it.
- Larger animation preview whose window takes the chosen face shape; face-shape controls moved to its right with a Landscape/Portrait dropdown.

## v0.3.1
- Animation preview face-shape buttons: Landscape 1:1, 16:9, 16:10, 2:1 and Portrait 9:16, 10:16, 1:2 (default 1:1). Replaces the automatic source/cell-shaped preview.
- LSL line and Copy LSL Line button removed.
- Default PNG name is now `<source><size>_<columns>_<rows>_<fps>.png`.

## v0.3.0
- Sheet Layout panel moved above Source.
- Manual mode sets Frames to take to columns × rows (still editable; Extract Frames applies it).
- Click a frame in the sheet preview to remove it, with Undo (Ctrl+Z) and Restore All; removed frames are also left out of GIF output. Playback spacing is kept.
- Bars now default to Color (black).
- Animation preview in Keep aspect mode uses the cell's proportions instead of the source's.

## v0.2.0
- Keep aspect mode: new Bars option, Transparent or an opaque color chosen with the Windows color picker. Color fills only the bars; frame transparency and empty cells are unchanged.
- Status line now shows the file name after loading.

## v0.1.0
First release.
- Animated GIF (also animated WebP/PNG) to sprite sheet, with full frame compositing and an every-Nth-frame option.
- Video (MP4, MOV, WebM, AVI, MKV and more) to sprite sheet, with clip start/end and frame count, and video to GIF with a shared palette and adjustable width.
- Automatic or manual columns/rows; 512, 1024 or 2048 PNG output with transparency; stretch or keep-aspect frame fit.
- Readout of grid, cell size and suggested fps, warnings for uneven grids, uneven GIF timing, tiny cells and frames that don't fit.
- Ready-to-copy `llSetTextureAnim` line, sheet preview and animation preview.
