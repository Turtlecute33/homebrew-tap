cask "megaglass" do
  version "0.2.5"
  sha256 "e3c54c35dfb83c66df05f8272a26731929a4d183bc1c5a862309d3b1a6d1af9f"

  url "https://github.com/Turtlecute33/MegaGlass-macOS/releases/download/v#{version}/MegaGlass-macos-#{version}.dmg"
  name "MegaGlass"
  desc "MEGA cloud client with a Liquid Glass interface"
  homepage "https://github.com/Turtlecute33/MegaGlass-macOS"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "MegaGlass.app"

  # The script deletes the session token and the Bypass API keys from the login Keychain.
  zap script: {
        executable:   "/bin/sh",
        args:         [
          "-c",
          "for s in app.megaglass.session app.megaglass.bypass; do " \
          "while /usr/bin/security delete-generic-password -s $s >/dev/null 2>&1; do :; done; done",
        ],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/MegaGlass",
        "~/Library/Caches/app.megaglass.MegaGlass",
        "~/Library/HTTPStorages/app.megaglass.MegaGlass",
        "~/Library/Preferences/app.megaglass.MegaGlass.plist",
        "~/Library/Saved Application State/app.megaglass.MegaGlass.savedState",
        "~/Library/WebKit/app.megaglass.MegaGlass",
      ]
end
