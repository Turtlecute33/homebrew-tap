cask "notallyxyz" do
  version "1.1.1"
  sha256 "e9ba19c39342880ca5ce87b9e62bbcdd742c65e4060474caf3e290f4fa75eb52"

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
