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

  plist = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Evernote"

  artifact staged_path, target: workflow
end
