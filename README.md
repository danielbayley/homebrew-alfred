[![badge][ci]][circle]

_[Homebrew]_ + _[Alfred]_ <img src="logo.svg" width="8%" align="right">
=======================================================================
Manage [Alfred] with [Homebrew].

[Workflows] require the paid _[Powerpack]_ upgrade.

Install
-------
~~~ sh
brew tap danielbayley/alfred
brew cask install #workflow
~~~

[Contribute][guide]
-------------------
`git config core.hooksPath hooks` and follow the contribution [guide], or copy and adapt an [existing] [_Cask_].

Because Alfred preferences can be [synced], the following Ruby code is necessary to install the workflow into the correct folder:
~~~ ruby
plist = '~/Library/Preferences/com.*.Alfred-Preferences-3.plist'
syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
workflows = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows/"

artifact staged_path, target: workflows + name[0]
~~~

License
-------
[MIT] © [Daniel Bayley]

[MIT]:              LICENSE.md
[Daniel Bayley]:    https://github.com/danielbayley

[ci]:               https://flat.badgen.net/circleci/github/danielbayley/homebrew-alfred?label=&icon=circleci
[circle]:           https://circleci.com/gh/danielbayley/homebrew-alfred

[alfred]:           http://alfredapp.com
[powerpack]:        https://alfredapp.com/powerpack
[workflows]:        http://alfredapp.com/workflows
[synced]:           https://alfredapp.com/help/advanced/sync

[homebrew]:         http://brew.sh
[_cask_]:           http://caskroom.github.io

[guide]:            https://github.com/caskroom/homebrew-cask/blob/master/doc/development/adding_a_cask.md
[existing]:         Casks
