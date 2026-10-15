# Homebrew tap

Homebrew casks of Turtlecute33 apps:

- [NotallyXYZ](https://github.com/Turtlecute33/NotallyXYZ): NotallyX notes with end-to-end
  encrypted sync to your own server.
- [MegaGlass](https://github.com/Turtlecute33/MegaGlass-macOS): MEGA cloud client with a
  Liquid Glass interface (Apple Silicon).

```zsh
brew install --cask turtlecute33/tap/notallyxyz   # install
brew install --cask turtlecute33/tap/megaglass
brew upgrade                                       # update, with all other Homebrew packages
```

macOS 26 or later. The apps are signed, but not notarized by Apple: on the first start macOS
blocks them. Click Done, then System Settings → Privacy & Security → Open Anyway. Homebrew keeps
this approval for later updates, because all releases of an app have the same signing identity
(NotallyXYZ from 1.1.1 on).

Each cask is updated by `update-tap.zsh` in the repository of its app after each release. The
`sha256` is the hash of the disk image in the GitHub release.
