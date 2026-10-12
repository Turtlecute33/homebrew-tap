# Homebrew tap

Homebrew casks of [NotallyXYZ](https://github.com/Turtlecute33/NotallyXYZ): NotallyX notes with
end-to-end encrypted sync to your own server.

```zsh
brew install --cask turtlecute33/tap/notallyxyz   # install
brew upgrade                                       # update, with all other Homebrew packages
```

macOS 26 or later. The app is signed, but not notarized by Apple: on the first start macOS blocks
it. Click Done, then System Settings → Privacy & Security → Open Anyway. Homebrew keeps this
approval for later updates, because all releases from 1.1.1 on have the same signing identity.

The cask is updated by `update-tap.zsh` in the NotallyXYZ repository after each release. The
`sha256` is the hash of the disk image in the GitHub release.
