cask "textfix" do
  version "1.5.0"
  sha256 "45eb5cf302724b90f28018b0d2e0a2cb75f9d61b04e0834e9ca8ac30ad9251a1"

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

    Each release has a new signature, so after an upgrade macOS treats TextFix as a new app.
    Remove the old TextFix entry in that list with the minus button, and add the new one.
  EOS
end
