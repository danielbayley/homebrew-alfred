cask 'alfred-theme-dracula' do
  version :latest
  sha256 :no_check

  # github.com/dracula/alfred was verified as official when first introduced to the cask
  url 'https://github.com/dracula/alfred/archive/master.zip'
  name 'Dracula'
  homepage 'https://draculatheme.com/alfred'

  depends_on cask: 'alfred'

  plist = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  theme = "#{syncfolder.chomp}/Alfred.alfredpreferences/themes/#{name.first}"

  artifact "alfred-master/#{name.first}.alfredappearance", target: "#{theme}/theme.json"

  uninstall rmdir: theme
end
