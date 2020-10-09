cask "alfred-finder-new-item" do
  version "1.0.4"
  sha256 "a6e8491bbf65dbe257aa04f9a575d6ac5ca5b1f9c31ff9907a23286c0e0043ff"

  url "https://registry.npmjs.org/#{token}/-/#{token}-#{version}.tgz"
  appcast "https://github.com/danielbayley/#{token}/releases.atom"
  name "New Item"
  desc "Swiftly create new items in Finder with support for templates"
  homepage "https://npmjs.org/package/#{token}#readme"

  depends_on cask: "alfred"
  depends_on formula: "node"
  container type: :naked

  ENV["PATH"] += ":#{HOMEBREW_PREFIX}/bin"
  installer script: {
    executable: "#{HOMEBREW_PREFIX}/bin/npm",
    args:       ["install", "--global", "#{staged_path}/#{token}-#{version}.tgz"],
  }

  uninstall script: {
    executable: "#{HOMEBREW_PREFIX}/bin/npm",
    args:       ["uninstall", "--global", token],
  }
end
