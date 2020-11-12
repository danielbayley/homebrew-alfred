cask "alfred-theme-simple-dark" do
  version "tDwbJXihRl"
  sha256 :no_check

  preview = url "https://alfredapp.com/extras/theme/#{version}"
  appcast "https://raw.githubusercontent.com/sindresorhus/alfred-simple/master/readme.md"
  name "Simple Dark"
  desc "#{name.first} theme for Alfred"
  homepage preview.to_s

  depends_on cask: "alfred"

  require_relative "../cmd/brew-alfred"
  theme = "#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}"
  artifact "theme.json", target: "#{theme}/theme.json"

  preflight do
    require "nokogiri"
    html = Nokogiri::HTML File.read "#{staged_path}/#{version}"
    href = html.xpath "//*[@id='installtheme']/a/@href"
    raw, = CGI.parse(href.text).values.flatten
    json = JSON.pretty_generate JSON.parse Base64.decode64 raw
    File.write "#{staged_path}/theme.json", json
  end

  uninstall rmdir: theme
end
