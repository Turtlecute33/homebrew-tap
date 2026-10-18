cask "textfix" do
  version "1.3.0"
  sha256 "ac4483aa00f71cde3de459d263b85350d31b110faeba677eb09535d958616b61"

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
