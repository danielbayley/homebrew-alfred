cask "alfred-theme-simple" do
  version :latest
  sha256 :no_check

  # github.com/dracula/alfred/ was verified as official when first introduced to the cask
  url "https://github.com/sindresorhus/alfred-simple/archive/master.zip"
  name "Simple"
  desc "Simple theme for Alfred"
  homepage "https://github.com/sindresorhus/alfred-simple#readme"

  depends_on cask: "alfred"

  require_relative "../cmd/brew-alfred"

  ["Light", "Dark"].map do |shade|
    artifact "alfred-simple-master/#{name.first} #{shade}.alfredappearance",
             target: "#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}-#{shade.downcase}/theme.json"
  end

  uninstall rmdir: Dir["#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}*"]
end
