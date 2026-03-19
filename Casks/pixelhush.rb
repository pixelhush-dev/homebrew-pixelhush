cask "pixelhush" do
  version "1.3.1"
  sha256 "ed2850493ff13d97fa97bb5fa0aa27e7ae6a480826ce99a8fc2e70df0357fe5b"

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
