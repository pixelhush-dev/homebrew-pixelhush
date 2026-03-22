cask "pixelhush" do
  version "1.5.0"
  sha256 "67212cc5d5e28930bb8c4af4e0cdbe4f7082c879f92fe88bb8171879a047b95d"

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
