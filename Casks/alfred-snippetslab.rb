cask 'alfred-snippetslab' do
  version :latest
  sha256 :no_check

  # dropbox.com/s/iviryouw1da8o09 was verified as official when first introduced to the cask
  url 'https://dropbox.com/s/iviryouw1da8o09/SnippetsLabAlfred.zip?dl=1'
  name 'SnippetsLab'
  homepage 'https://renfei.org/snippets-lab/manual/mac/tips-and-tricks/alfred-integration.html'

  depends_on cask: 'alfred'

  plist = Dir["#{ENV['HOME']}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/" + name[0]

  artifact staged_path, target: workflow
end
