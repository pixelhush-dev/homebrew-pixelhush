cask "pixelhush" do
  version "1.3.1"
  sha256 "a7c05f26377c9bf273779feb10e580948165f815066dcde35e800dd94fcf885e"

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
