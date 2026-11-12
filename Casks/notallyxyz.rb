cask "notallyxyz" do
  version "1.1.5"
  sha256 "d484176bc1f866aed97379f019198b20f8bfdcbe54b8417756588da76ae6e8fd"

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
