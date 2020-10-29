cask "alfred-reminder-drafts" do
  version :latest
  sha256 :no_check

  url "https://agiletortoise.com/downloads/Reminder-in-Drafts-List.alfredworkflow"
  name "Reminder in Drafts List"
  desc "Pass off text via the Drafts list in the Reminders app"
  homepage "https://agiletortoise.com/blog/2016/06/08/getting-text-into-drafts-from-a-mac"

  depends_on cask: "alfred"

  plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflows = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows"

  artifact staged_path, target: "#{workflows}/homebrew.workflow.#{token}"
end
