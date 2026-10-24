# DropWheel

A free Mac menu-bar app. While you drag any file, tap a key and a wheel appears at your pointer:
convert it, edit it, compress it, AirDrop it. The result is saved beside the original.

**Website:** https://manishvk514.github.io/dropwheel-app/

## Download

Works on Apple silicon and Intel Macs, macOS 13 Ventura or later.

- **[Download DropWheel.dmg](https://github.com/manishvk514/dropwheel-app/releases/latest/download/DropWheel.dmg)** — open it and drag DropWheel to Applications.
- [Download DropWheel.zip](https://github.com/manishvk514/dropwheel-app/releases/latest/download/DropWheel.zip)
- Or in Terminal:

  ```bash
  curl -fsSL https://manishvk514.github.io/dropwheel-app/install.sh | bash
  ```

### First open

DropWheel isn't from the App Store, so the first time you open a downloaded copy macOS asks to confirm:
open it once, then go to **System Settings → Privacy & Security** and click **Open Anyway**.
The Terminal install above skips this step.

### Engines

Images, PDFs and many documents convert out of the box. Video, audio and office formats use free
open-source engines (FFmpeg, libvips, LibreOffice and others): menu-bar icon → **Engines…** →
**Install Missing** (uses [Homebrew](https://brew.sh)).

## Privacy

DropWheel works entirely on your Mac. No account, no cloud, no telemetry.

## Notes

DropWheel is an independent project. It is not affiliated with, and does not use the name, logo,
icons, images or sounds of, any other drag-and-drop or file-conversion app.
This repository hosts the website and the downloads.
