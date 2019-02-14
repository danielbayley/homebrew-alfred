cask 'alfred-evernote' do
  version '9b3'
  sha256 '8783ba06f714ec26e48f5e4a881fd4569b0e65e0b944c3b06a730ad9817d8739'

  # dropbox.com/s/2l57ziiv3e3uivx was verified as official when first introduced to the cask
  url "https://dropbox.com/s/2l57ziiv3e3uivx/Evernote#{version}.alfredworkflow?dl=1"
  appcast 'https://alfredforum.com/topic/840-evernote-workflow'
  name 'Evernote'
  homepage 'https://appcenter.evernote.com/app/alfred/mac'

  depends_on cask: 'alfred'
  depends_on cask: 'evernote'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Evernote"

  artifact staged_path, target: workflow
end
