cask 'alfred-numi' do
  version '3.20.4'
  sha256 'de88c986acdfc418263f1e176aabe6dc8c251f4adc9a7eff974120d2e3fd5b02'

  # github.com/nikolaeu/Numi was verified as official when first introduced to the cask
  url "https://github.com/nikolaeu/Numi/releases/download/mac-#{version}/Numi.alfredworkflow"
  appcast 'https://github.com/nikolaeu/Numi/releases.atom'
  name 'Numi'
  homepage 'https://numi.io/docs/#alfred'

  depends_on cask: 'alfred'
  depends_on cask: 'numi'

  plist = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Numi"

  artifact staged_path, target: workflow
end
