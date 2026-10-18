# Homebrew tap

Homebrew casks of Turtlecute33 apps:

- [NotallyXYZ](https://github.com/Turtlecute33/NotallyXYZ): NotallyX notes with end-to-end
  encrypted sync to your own server.
- [MegaGlass](https://github.com/Turtlecute33/MegaGlass-macOS): MEGA cloud client with a
  Liquid Glass interface (Apple Silicon).
- [TextFix](https://github.com/Turtlecute33/TextFix): fixes the text in any text box with one
  hotkey and your own AI provider key.

```zsh
brew install --cask turtlecute33/tap/notallyxyz   # install
brew install --cask turtlecute33/tap/megaglass
brew install --cask turtlecute33/tap/textfix
brew upgrade                                       # update, with all other Homebrew packages
```

NotallyXYZ and MegaGlass need macOS 26 or later, TextFix macOS 13 or later. The apps are signed,
but not notarized by Apple: on the first start macOS blocks them. Click Done, then System Settings
→ Privacy & Security → Open Anyway. Homebrew keeps this approval for later updates, because all
releases of an app have the same signing identity (NotallyXYZ from 1.1.1 on). TextFix is the
exception: it is signed ad hoc, so after an update approve it again, and in Privacy & Security →
Accessibility remove the old TextFix entry and add the new one.

Each cask is updated by `update-tap.zsh` in the repository of its app after each release. The
`sha256` is the hash of the disk image (for TextFix, the zip archive) in the GitHub release.
