# Sprite Sheet Maker — Release Notes

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
- Tooltips on buttons, boxes and dropdowns in the main window, the expanded preview, Preferences and GIF Settings. Greyed-out controls say why they're unavailable. View > Show Tooltips turns them off.
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
- The expanded preview snaps against the main window when let go within about 20 pixels of it, then follows it when the main window is moved or resized, and is hidden while it's minimised. Dragging it away or maximising the main window separates it.

## v0.9.3
- Sprite sheets are now named like `clip2k;8;8;10;57.png`: source name and texture size (512, 1k or 2k), then columns, rows, FPS and frame count, separated by semicolons. This matches the name layout common texture animation scripts read, so sheets work with them without renaming. Whole rates are written without ".0", and semicolons in the source name become underscores.

## v0.9.2
- Faster extraction from long clips: when the wanted frames are far apart, the program jumps ahead to each one instead of reading every frame in between. It picks exactly the same frames as before. In tests on a 3-minute 1080p clip, 16 frames took about 2 seconds instead of 11, and 64 frames about 8 instead of 15.

## v0.9.1
- File > Close Current File (Ctrl+W): unloads the file, clears both previews and closes the expanded preview, asking first if the sprite sheet has unsaved changes.
- The Save Sprite Sheet button is now greyed out until there is a sheet, like its menu item.

## v0.9.0
- Play modes in the animation preview: Loop, Reverse, Ping-pong, and Start/Length to play a range of cells (Start counts from 0, like the script), plus a Replay button. The same controls are in the expanded preview. They only affect the preview.
- GIF Options is now GIF Settings, with Reverse, Ping-pong and Play once checkboxes beside the GIF width. They start unticked at every launch.

## v0.8.9
- Edge padding is now a solid border instead of repeated edge pixels, which didn't stop the neighbouring frame showing at the face edge in-world. The border is black in Stretch, and the bar colour (or transparent) in Keep aspect.

## v0.8.8
- Edge padding (0 to 5 px) in Sheet Layout: shrinks each frame and repeats its outer pixels around it, so neighbouring frames don't bleed into each other in-world. The starting value is set in Preferences (default 0). With Keep aspect, only the sides where the picture reaches the cell edge are padded.
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
- View > Preview Face renamed to Preview; its Landscape and Portrait headings are now bold instead of greyed out, with a double separator under each.

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
- Main window and expanded preview remember position and size (main window also maximised state); optional fixed monitor for each, with Identify Monitors.
- Default folder option (off by default, Desktop to start); otherwise dialogs start in the last folder used.
- Main window can be enlarged; the previews grow to fill it (sheet two-thirds, animation one-third). Current size is the minimum.
- Help > Readme and Help > Release Notes open those files from the program folder.

## v0.5.0
- Face Shape panel renamed "Animation Preview (as played in SL)"; header above the right-side preview removed and the preview resized to 420 × 220 so the window fits a 1366 × 768 screen. Left-side spacing tightened.
- New FPS dropdown (presets or typed) on the same line as Landscape/Portrait; drives preview speed, PNG file name rate and GIF timing. Save GIF greyed out above 50 fps.
- Expand Preview button: separate resizable window in the face shape, with orientation, FPS and ratio controls in its bottom bar; the small preview pauses while it's open.

## v0.4.0
- Keep aspect now fits the bars to the chosen Face Shape, so the picture keeps its true proportions on that face; the saved PNG follows the face shape.
- Save area: header removed, "Save Sprite Sheet" and "Save GIF..." side by side (Save GIF greyed out for GIF sources).
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
- Keep aspect mode: new Bars option, Transparent or an opaque colour chosen with the Windows colour picker. Colour fills only the bars; frame transparency and empty cells are unchanged.
- Status line now shows the file name after loading.

## v0.1.0
First release.
- Animated GIF (also animated WebP/PNG) to sprite sheet, with full frame compositing and an every-Nth-frame option.
- Video (MP4, MOV, WebM, AVI, MKV and more) to sprite sheet, with clip start/end and frame count, and video to GIF with a shared palette and adjustable width.
- Automatic or manual columns/rows; 512, 1024 or 2048 PNG output with transparency; stretch or keep-aspect frame fit.
- Readout of grid, cell size and suggested fps, warnings for uneven grids, uneven GIF timing, tiny cells and frames that don't fit.
- Ready-to-copy `llSetTextureAnim` line, sheet preview and animation preview.
