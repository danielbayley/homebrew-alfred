cask 'alfred-evernote' do
  version '9b2'
  sha256 'f0a360db9d9d0653a9047cafe43afc1ac360eb0a0dc1233730a70e2648fc782a'

  # dropbox.com/s/81boxuxnpueo1yz was verified as official when first introduced to the cask
  url "https://dropbox.com/s/81boxuxnpueo1yz/Evernote#{version}.alfredworkflow?dl=1"
  name 'Evernote'
  homepage 'https://appcenter.evernote.com/app/alfred/mac'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Evernote"

  artifact staged_path, target: workflow
end
