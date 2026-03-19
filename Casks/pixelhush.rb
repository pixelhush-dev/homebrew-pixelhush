cask "pixelhush" do
  version "1.3.3"
  sha256 "bb810a92bdd68eef0b5d07ba0df373f63fb5ff365a3c180655535278d254f24a"

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
