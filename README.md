<img src="logo.svg" width="16%" align="left">

_[Homebrew]_ + _[Alfred]_
=========================
Manage [Alfred] with [Homebrew]. [Workflows] require the paid _[Powerpack]_ upgrade.

Install
-------
~~~ sh
brew tap danielbayley/alfred
brew alfred install #workflow #theme
~~~
or with [`brew bundle`] using a _[Brewfile]_:
~~~ rb
# Brewfile
tap "danielbayley/alfred"
cask "alfred-theme"
# App dependency already installed independently.
alfred "alfred-workflow", args: { "skip-cask-deps": true }
~~~

[Contribute][guide]
-------------------
~~~ sh
brew tap danielbayley/pipeline
git config core.hooksPath .github/hooks
~~~
and follow the contribution [guide], or copy and adapt an [existing] _[Cask]_.

Because Alfred preferences can be [synced], the following Ruby code is necessary to install the workflow into the correct folder:
~~~ ruby
require_relative "../cmd/brew-alfred"
artifact staged_path, target: "#{HOMEBREW_ALFRED_WORKFLOW_PREFIX}.#{token}"
~~~
or with slightly different code for [themes]:
~~~ ruby
theme = "#{HOMEBREW_ALFRED_THEME_PREFIX}.#{token}"
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
[cask]:             https://docs.brew.sh/Cask-Cookbook
[`brew bundle`]:    https://docs.brew.sh/Manpage#bundle-subcommand
[brewfile]:         https://github.com/Homebrew/homebrew-bundle#usage

[guide]:            https://docs.brew.sh/Adding-Software-to-Homebrew#writing-the-cask
[existing]:         Casks
