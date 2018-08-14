cask 'alfred-numi' do
  version '1.2.1'
  sha256 '8d58d2718008b49a0929b9db370fdc9d194006d90b87cb2831efb15dc16628e1'

  # github.com/nikolaeu/Numi-extensions was verified as official when first introduced to the cask
  url "https://github.com/nikolaeu/Numi-extensions/releases/download/#{version}/Numi.alfredworkflow"
  appcast 'https://github.com/nikolaeu/Numi-extensions/releases.atom',
          checkpoint: '90ecddd1f29fec3db22ef4de0d885dd52227bacf30cdb979955c09f82365046d'
  name 'Numi'
  homepage 'http://numi.io/blog/alfred'

  depends_on cask: 'alfred'
  depends_on cask: 'numi'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Numi"

  artifact staged_path, target: workflow
end
