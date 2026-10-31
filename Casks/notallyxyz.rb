cask "notallyxyz" do
  version "1.1.4"
  sha256 "932f8777122e81056542041f5c8b88136430f05e512cc2edffbeb8098f5e77cb"

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
