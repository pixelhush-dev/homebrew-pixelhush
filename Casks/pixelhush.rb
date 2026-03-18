cask "pixelhush" do
  version "1.3.0"
  sha256 "096d85e7941babd17573dcd35c8481af95796d8c6044bbe2b4dd8b0e1dc39575"

  url "https://pixelhush.dev/releases/PixelHush-#{version}.dmg"
  name "PixelHush"
  desc "Automatically hide secrets in code editors when screen recording starts"
  homepage "https://pixelhush.dev"

  app "PixelHush.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/PixelHush.app"],
                   sudo: false
  end

  uninstall quit: "dev.pixelhush.agent"

  zap trash: "~/.pixelhush"
end
