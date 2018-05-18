cask 'alfred-snippetslab' do
  version '1.7.1'
  sha256 'df71325e941be53685895e813ed645b0cc445f156bf9d917867cb10f6633ca7e'

  # dropbox.com/s/iviryouw1da8o09 was verified as official when first introduced to the cask
  url 'https://dropbox.com/s/iviryouw1da8o09/SnippetsLabAlfred.zip?dl=1'
  name 'SnippetsLab'
  homepage 'https://renfei.org/snippets-lab/manual/mac/tips-and-tricks/alfred-integration.html'

  depends_on cask: 'alfred'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/" + name[0]

  artifact staged_path, target: workflow
end
