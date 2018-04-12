cask 'alfred-things' do
  version '3,2017.05'
  sha256 '508ffea9bfb2f2ebb3e0c29b570ac9d71c5de8991aaf6bf97660e3fdff15cb98'

  url "https://culturedcode.com/frozen/#{version.after_comma.dots_to_slashes}/Add-To-Do-to-Things-#{version.major}.alfredworkflow.zip"
  name "Add To-Do to Things #{version.major}"
  homepage 'https://support.culturedcode.com/customer/en/portal/articles/2803574-creating-to-dos-with-a-launcher'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Things"

  artifact staged_path, target: workflow
end
