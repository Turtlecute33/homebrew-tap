cask "notallyxyz" do
  version "1.1.6"
  sha256 "39b68cff44aaafd0229447e9b8d488e0894bc4827029df8327e1efd31cba4858"

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
