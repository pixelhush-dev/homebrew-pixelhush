cask "pixelhush" do
  version "1.3.2"
  sha256 "617885ca386a6b06f333886bd1ff737b39ac6c25307d9e365ed9368113e8bf57"

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
