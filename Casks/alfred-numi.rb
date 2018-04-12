cask 'alfred-numi' do
  version '1.2'
  sha256 '58a6e97e6905d4a22667df85407b774008a186f0b20af1915f96a5347adfd41d'

  # github.com/nikolaeu/Numi-extensions was verified as official when first introduced to the cask
  url "https://github.com/nikolaeu/Numi-extensions/releases/download/#{version}/Numi.alfredworkflow"
  appcast 'https://github.com/nikolaeu/Numi-extensions/releases.atom',
          checkpoint: '90ecddd1f29fec3db22ef4de0d885dd52227bacf30cdb979955c09f82365046d'
  name 'Numi'
  homepage 'http://numi.io/blog/alfred'

  depends_on cask: 'numi'

  plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflow = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/Numi"

  artifact staged_path, target: workflow
end
