cask "alfred-reminder-drafts" do
  version :latest
  sha256 :no_check

  url "https://agiletortoise.com/downloads/Reminder-in-Drafts-List.alfredworkflow"
  name "Reminder in Drafts List"
  desc "Pass off text via the Drafts list in the Reminders app"
  homepage "https://agiletortoise.com/blog/2016/06/08/getting-text-into-drafts-from-a-mac"

  depends_on cask: "alfred"

  require_relative "../cmd/brew-alfred"
  artifact staged_path, target: "#{HOMEBREW_ALFRED_WORKFLOW_PREFIX}.#{token}"
end
