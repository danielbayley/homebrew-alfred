cask 'alfred-wireguard' do
  version '1.0'
  sha256 '9118082580961af6bb1bb4c6c3a53ba4551e99683d7f497789f717d4ef3566cd'

  url "https://github.com/Chrede88/alfred-wireguard/releases/download/v#{version}/alfred-wireguard.alfredworkflow"
  appcast 'https://github.com/chrede88/alfred-wireguard/releases'
  name 'alfred-wireguard'
  homepage 'https://github.com/Chrede88/alfred-wireguard'

  plist = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/" + name.first

  artifact staged_path, target: workflow
end
