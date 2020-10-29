cask "alfred-snippetslab" do
  version :latest
  sha256 :no_check

  # dropbox.com/s/iviryouw1da8o09/ was verified as official when first introduced to the cask
  url "https://dropbox.com/s/iviryouw1da8o09/SnippetsLabAlfred.zip?dl=1"
  name "SnippetsLab"
  desc "Search for snippets right from Alfred and view all search results in SnippetsLab"
  homepage "https://renfei.org/snippets-lab/manual/mac/tips-and-tricks/alfred-integration.html"

  depends_on cask: "alfred"

  plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflows = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows"

  artifact staged_path, target: "#{workflows}/homebrew.workflow.#{token}"
end
