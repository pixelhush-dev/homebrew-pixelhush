cask "pixelhush" do
  version "1.5.5"
  sha256 "c5b5e51626eecef4ccea66928b37945422233c89bd4b01024282eea1d445f98d"

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
