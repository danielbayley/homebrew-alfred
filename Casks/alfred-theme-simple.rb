cask "alfred-theme-simple" do
  version :latest
  sha256 :no_check

  # github.com/dracula/alfred/ was verified as official when first introduced to the cask
  url "https://github.com/sindresorhus/alfred-simple/archive/master.zip"
  name "Simple"
  desc "Simple theme for Alfred"
  homepage "https://github.com/sindresorhus/alfred-simple#readme"

  depends_on cask: "alfred"

  plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  themes = "#{syncfolder.chomp}/Alfred.alfredpreferences/themes"

  ["Light", "Dark"].map do |shade|
    artifact "alfred-simple-master/#{name.first} #{shade}.alfredappearance",
             target: "#{themes}/theme.homebrew.#{token}-#{shade.downcase}/theme.json"
  end

  uninstall rmdir: "#{themes}/#{token}*"
end
