cask "alfred-snippetslab" do
  version :latest
  sha256 :no_check

  dropbox = "dropbox.com/s/iviryouw1da8o09/"
  url "https://#{dropbox}SnippetsLabAlfred.zip?dl=1", verified: dropbox
  name "SnippetsLab"
  desc "Search for snippets right from Alfred and view all search results in SnippetsLab"
  homepage "https://renfei.org/snippets-lab/manual/mac/tips-and-tricks/alfred-integration.html"

  depends_on cask: "alfred"

  require_relative "../cmd/brew-alfred"
  artifact staged_path, target: "#{HOMEBREW_ALFRED_WORKFLOW_PREFIX}.#{token}"
end
