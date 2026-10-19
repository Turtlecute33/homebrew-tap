cask "notallyxyz" do
  version "1.1.2"
  sha256 "c2896754e7d6f31e43efa8bd5d8baf35e7bad2c0321449c4e1ee4de1aed0aa32"

  url "https://github.com/Turtlecute33/NotallyXYZ/releases/download/v#{version}/NotallyXYZ-macos-#{version}.dmg"
  name "NotallyXYZ"
  desc "NotallyX notes with end-to-end encrypted sync to your own server"
  homepage "https://github.com/Turtlecute33/NotallyXYZ"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "NotallyXYZ.app"

  zap trash: [
    "~/Library/Application Scripts/com.notallyxyz.mac",
    "~/Library/Containers/com.notallyxyz.mac",
  ]
end
