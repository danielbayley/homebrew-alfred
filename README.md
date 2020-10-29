_[Homebrew]_ + _[Alfred]_ <img src="logo.svg" width="8%" align="right">
=======================================================================
Manage [Alfred] with [Homebrew].

[Workflows] require the paid _[Powerpack]_ upgrade.

Install
-------
~~~ sh
brew tap danielbayley/alfred
brew cask install #alfred-workflow #alfred-theme
~~~
or with [`brew bundle`] using a _[Brewfile]_:
~~~ rb
# Brewfile
tap 'danielbayley/alfred'
cask 'alfred-theme'
# App dependency already installed with Setapp
cask 'alfred-workflow', args: { 'skip-cask-deps': true }
~~~

[Contribute][guide]
-------------------
`git config core.hooksPath .github/hooks` and follow the contribution [guide], or copy and adapt an [existing] [_Cask_].

Because Alfred preferences can be [synced], the following Ruby code is necessary to install the workflow into the correct folder:
~~~ ruby
plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
workflows = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows"

artifact staged_path, target: "#{workflows}/homebrew.workflow.#{token}"
~~~
or with slightly different code for [themes]:
~~~ ruby
theme = "#{syncfolder.chomp}/Alfred.alfredpreferences/themes/theme.homebrew.#{token}"

artifact "theme.json", target: "#{theme}/theme.json"

uninstall rmdir: theme
~~~

License
-------
[MIT] © [Daniel Bayley]

[MIT]:              LICENSE.md
[Daniel Bayley]:    https://github.com/danielbayley

[alfred]:           https://alfredapp.com
[powerpack]:        https://alfredapp.com/powerpack
[workflows]:        https://alfredapp.com/workflows
[themes]:           https://alfredapp.com/help/appearance#theme
[synced]:           https://alfredapp.com/help/advanced/sync

[homebrew]:         https://brew.sh
[_cask_]:           https://caskroom.github.io
[`brew bundle`]:    https://docs.brew.sh/Manpage#bundle-subcommand
[brewfile]:         https://github.com/Homebrew/homebrew-bundle#usage

[guide]:            https://github.com/caskroom/homebrew-cask/blob/master/doc/development/adding_a_cask.md
[existing]:         Casks
