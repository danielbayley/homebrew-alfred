cask "alfred-evernote" do
  version "9b4"
  sha256 "1416e41bc88507f38489e03704ae093271aaa7a87af305d969fd86f62b369204"

  # dropbox.com/s/p7am1212afu3a5j/ was verified as official when first introduced to the cask
  url "https://dropbox.com/s/p7am1212afu3a5j/Evernote#{version}.alfredworkflow?dl=1"
  appcast "https://alfredforum.com/topic/840-evernote-workflow"
  name "Evernote"
  desc "Search or browse your Evernote library, as well as create notes and reminders"
  homepage "https://appcenter.evernote.com/app/alfred/mac"

  depends_on cask: "alfred"
  depends_on cask: "evernote"

  require_relative "../cmd/brew-alfred"
  artifact staged_path, target: "#{HOMEBREW_ALFRED_WORKFLOW_PREFIX}.#{token}"
end
