cask 'alfred-numi' do
  version '1.2.1'
  sha256 '8d58d2718008b49a0929b9db370fdc9d194006d90b87cb2831efb15dc16628e1'

  # github.com/nikolaeu/Numi-extensions was verified as official when first introduced to the cask
  url "https://github.com/nikolaeu/Numi-extensions/releases/download/#{version}/Numi.alfredworkflow"
  appcast 'https://github.com/nikolaeu/Numi-extensions/releases.atom'
  name 'Numi'
  homepage 'https://numi.io/docs/#alfred'

  depends_on cask: 'alfred'
  depends_on cask: 'numi'

  plist = Dir["#{ENV['HOME']}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist.first} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Numi"

  artifact staged_path, target: workflow
end
