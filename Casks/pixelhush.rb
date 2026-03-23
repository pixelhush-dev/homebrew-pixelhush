cask "pixelhush" do
  version "1.5.2"
  sha256 "f407dd46448ac05960f3b89fd48b43c0ac7cbb58391259bc65bbb8ffe15dc15f"

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
