cask "alfred-numi" do
  version "3.20.4"
  sha256 "de88c986acdfc418263f1e176aabe6dc8c251f4adc9a7eff974120d2e3fd5b02"

  repo = "github.com/nikolaeu/Numi/"
  url "https://#{repo}releases/download/mac-#{version}/Numi.alfredworkflow", verified: repo
  appcast "https://#{repo}wiki/Alfred-Integration", must_contain: url.to_s
  name "Numi"
  desc "Use #{name.first} with Alfred for quick calculations"
  homepage "https://numi.io/docs/#alfred"

  depends_on cask: "alfred"
  depends_on cask: "numi"
  depends_on formula: "php" if Hardware::CPU.arch == :arm64

  require_relative "../cmd/brew-alfred"
  artifact staged_path, target: "#{HOMEBREW_ALFRED_WORKFLOW_PREFIX}.#{token}"
end
