# frozen_string_literal: true

plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
syncfolder = `/usr/bin/defaults read '#{plist}' syncfolder 2> /dev/null`

syncfolder = if plist && syncfolder.present?
  File.expand_path syncfolder.chomp
else
  "#{Dir.home}/Library/Application Support/Alfred"
end

HOMEBREW_ALFRED_PREFERENCES     = "#{syncfolder}/Alfred.alfredpreferences"
HOMEBREW_ALFRED_WORKFLOW_PREFIX = "#{HOMEBREW_ALFRED_PREFERENCES}/workflows/homebrew.workflow"
HOMEBREW_ALFRED_THEME_PREFIX    = "#{HOMEBREW_ALFRED_PREFERENCES}/themes/theme.homebrew"
HOMEBREW_ALFRED_RESOURCES       = "#{HOMEBREW_ALFRED_PREFERENCES}/resources"

return if caller.first.match? %r{#{HOMEBREW_LIBRARY}/Taps/.+require}o

def prefix(arg)
  prefix = "alfred-"
  return arg if %r{^-|#{prefix}|/}.match?(arg)

  prefix + arg
end

ARGV[0] = "list" if ARGV.first == "ls"

args = ARGV.first, *ARGV.drop(1).map(&method(:prefix))

taps = Tap.cmd_directories.join ","
command, = Dir["{#{taps},#{__dir__}}/brewalfred-#{args.first}{.*,}"]

if command
  args.shift
  command.end_with?(".rb") ? require(command) : exec(command, *args)
else
  exec HOMEBREW_BREW_FILE, *args
end
