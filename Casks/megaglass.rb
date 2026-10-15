cask "megaglass" do
  version "0.1.0"
  sha256 "bb7e635a2959b738a60ca51eb505f05d91acba6d6fdd08ad49c12372abd16725"

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

  zap trash: [
    "~/Library/Application Support/MegaGlass",
    "~/Library/Caches/app.megaglass.MegaGlass",
    "~/Library/HTTPStorages/app.megaglass.MegaGlass",
    "~/Library/Preferences/app.megaglass.MegaGlass.plist",
    "~/Library/Saved Application State/app.megaglass.MegaGlass.savedState",
    "~/Library/WebKit/app.megaglass.MegaGlass",
  ]
end
