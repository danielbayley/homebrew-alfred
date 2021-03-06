cask "alfred-wireguard" do
  version "1.0"
  sha256 "9118082580961af6bb1bb4c6c3a53ba4551e99683d7f497789f717d4ef3566cd"

  url "https://github.com/Chrede88/alfred-wireguard/releases/download/v#{version}/alfred-wireguard.alfredworkflow"
  appcast "https://github.com/chrede88/alfred-wireguard/releases"
  name "alfred-wireguard"
  desc "Simple Alfred workflow for toggling WireGuard VPN tunnels"
  homepage "https://github.com/Chrede88/alfred-wireguard"

  require_relative "../cmd/brew-alfred"
  artifact staged_path, target: "#{HOMEBREW_ALFRED_WORKFLOW_PREFIX}.#{token}"
end
