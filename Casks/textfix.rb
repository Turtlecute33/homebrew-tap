cask "textfix" do
  version "1.7.0"
  sha256 "b4ccb0e563e353ea136bfe17b6dab2605e43b11ba2af6188d09f6410aa621f3d"

  url "https://github.com/Turtlecute33/TextFix/releases/download/v#{version}/TextFix-macos-universal.zip"
  name "TextFix"
  desc "Fix the text in any text box with one hotkey and your own AI key"
  homepage "https://github.com/Turtlecute33/TextFix"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "TextFix.app"

  uninstall quit: "com.turtlecute33.textfix"

  # The script deletes the API keys (one item per provider) from the login Keychain.
  zap script: {
        executable:   "/bin/sh",
        args:         [
          "-c",
          "while /usr/bin/security delete-generic-password -s com.turtlecute33.textfix >/dev/null 2>&1; do :; done",
        ],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/TextFix",
        "~/Library/Logs/TextFix",
      ]

  caveats <<~EOS
    TextFix needs Accessibility permission:
      System Settings > Privacy & Security > Accessibility

    Releases from 1.7.0 on share one signing certificate, so the permission stays after an
    upgrade. After the upgrade from 1.6.x or older, remove the old TextFix entry in that list
    with the minus button, and add the new one.
  EOS
end
