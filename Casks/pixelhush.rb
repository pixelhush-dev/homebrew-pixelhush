cask "pixelhush" do
  version "1.5.4"
  sha256 "d99659fbae84aadc21e740bd5b341d5acedbda17df04c54dd162088857175b77"

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

  uninstall quit: "com.daniilpostnov.pixelhush"

  zap trash: "~/.pixelhush"
end
