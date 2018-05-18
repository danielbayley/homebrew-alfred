cask 'alfred-reminder-drafts' do
  version :latest
  sha256 :no_check

  url 'https://agiletortoise.com/downloads/Reminder-in-Drafts-List.alfredworkflow'
  name 'Reminder in Drafts List'
  homepage 'https://agiletortoise.com/blog/2016/06/08/getting-text-into-drafts-from-a-mac'

  depends_on cask: 'alfred'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/" + name[0]

  artifact staged_path, target: workflow
end
