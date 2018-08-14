cask 'alfred-finder-new-item' do
  version '1.0.4'
  sha256 'a6e8491bbf65dbe257aa04f9a575d6ac5ca5b1f9c31ff9907a23286c0e0043ff'

  url "https://registry.npmjs.org/#{token}/-/#{token}-#{version}.tgz"
  appcast "https://github.com/danielbayley/#{token}/releases.atom",
          checkpoint: '7375d5a63a45d9e9ad4ac9b02c28ed7e97dd6e392ad68b83e6444146522c53c8'
  name 'New Item'
  homepage "https://npmjs.org/package/#{token}#readme"

  depends_on cask: 'alfred'
  depends_on formula: 'node'
  container type: :naked

  ENV['PATH'] += ":#{HOMEBREW_PREFIX}/bin"
  installer script: {
                      executable: "#{HOMEBREW_PREFIX}/bin/npm",
                      args:       ['install', '--global', "#{staged_path}/#{token}-#{version}.tgz"],
                    }

  uninstall script: {
                      executable: "#{HOMEBREW_PREFIX}/bin/npm",
                      args:       ['uninstall', '--global', token],
                    }
end
