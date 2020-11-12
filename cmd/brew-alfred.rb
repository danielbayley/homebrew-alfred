# frozen_string_literal: true

plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
syncfolder = `/usr/bin/defaults read '#{plist}' syncfolder 2> /dev/null`

syncfolder = if plist && !syncfolder.blank?
  File.expand_path syncfolder.chomp
else
  "#{Dir.home}/Library/Application Support/Alfred"
end

HOMEBREW_ALFRED_PREFERENCES     = "#{syncfolder}/Alfred.alfredpreferences"
HOMEBREW_ALFRED_WORKFLOW_PREFIX = "#{HOMEBREW_ALFRED_PREFERENCES}/workflows/homebrew.workflow"
HOMEBREW_ALFRED_THEME_PREFIX    = "#{HOMEBREW_ALFRED_PREFERENCES}/themes/theme.homebrew"
HOMEBREW_ALFRED_RESOURCES       = "#{HOMEBREW_ALFRED_PREFERENCES}/resources"

return if caller.first.include? "require"

def prefix(arg)
  prefix = "alfred-"
  return arg if %r{^-|#{prefix}|/}.match?(arg)

  prefix + arg
end

ARGV[0] = "list" if ARGV.first == "ls"

ARGV = [ARGV.shift, *ARGV.map(&method(:prefix))].freeze

taps = Tap.cmd_directories.join ","
command, = Dir["{#{taps},#{__dir__}}/brewalfred-#{ARGV.first}{.*,}"]

if command
  ARGV.shift
  command.end_with?(".rb") ? require(command) : exec(command, *ARGV)
else
  exec "brew", "cask", *ARGV
end
