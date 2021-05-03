cask "alfred-theme-simple" do
  version :latest
  sha256 :no_check

  repo = "https://github.com/sindresorhus/alfred-simple"
  url "#{repo}/archive/main.zip"
  name "Simple"
  desc "Simple theme for Alfred"
  homepage "#{repo}#readme"

  depends_on cask: "alfred"

  require_relative "../cmd/brew-alfred"

  ["Light", "Dark"].map do |shade|
    artifact "alfred-simple-master/#{name.first} #{shade}.alfredappearance",
             target: "#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}-#{shade.downcase}/theme.json"
  end

  uninstall rmdir: Dir["#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}*"]
end
