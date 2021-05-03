cask "alfred-theme-dracula" do
  version "1.2.5"
  sha256 :no_check

  repo = "github.com/dracula/alfred/"
  url "https://#{repo}archive/master.zip", verified: repo
  appcast "https://#{repo}releases.atom"
  name "Dracula"
  desc "Dark theme for Alfred"
  homepage "https://draculatheme.com/alfred"

  depends_on cask: "alfred"

  require_relative "../cmd/brew-alfred"
  theme = "#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}"
  artifact "alfred-master/#{name.first}.alfredappearance", target: "#{theme}/theme.json"

  uninstall rmdir: theme
end
