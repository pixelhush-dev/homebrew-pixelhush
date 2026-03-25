cask "pixelhush" do
  version "1.5.8"
  sha256 "f98a3d65d54fc4a65bb8ca64d7d7ab37d7f0e3508391b9d80883b18d7bb1697c"

  url "https://pixelhush.dev/releases/PixelHush-#{version}.dmg"
  name "PixelHush"
  desc "Automatically hide secrets in code editors when screen recording starts"
  homepage "https://pixelhush.dev"

  app "PixelHush.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/PixelHush.app"],
                   sudo: false

    system_command "/usr/bin/open",
                   args: ["#{appdir}/PixelHush.app"],
                   sudo: false
  end

  uninstall quit: "com.daniilpostnov.pixelhush"

  zap trash: "~/.pixelhush"
end
