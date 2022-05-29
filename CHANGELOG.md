## [Unreleased]

## [0.1.0] - 2021-12-31
- Initial release

## [0.2.0] - 2022-01-03
- Fixed many bugs

## [0.3.0] - 2022-05-18
### Changed
- `full(brew)` method updated

usage example

    $ smolt full ffmpeg

- `diff(brew)` method updated

usage example

    $ smolt diff ffmpeg

## [0.3.1] - 2022-05-19
### Changed
- Fixed some codes accoding to rubocop

## [0.3.2] - 2022-05-19
### Added
- `version` command

usage

    $ smolt version

## [0.3.3] - 2022-05-19
### Fixed
- Show message like `{berw} is already installed.`

## [0.4.0] - 2022-05-24
### Change
- the word 'brew' to 'formula'

### Removed
- Show message like `{formula} is already installed.`
- Pattern like 'the formula is already installed'. Because 'does not require any dependencies covers it'
- Method `full`. Because you can find out formulas already installed by `brew list` command

## [0.4.1] - 2022-05-26
### Change
- path for `require` in exe/smolt

## [0.4.2] - 2022-05-27
### Change
- path for `require` in lib/smolt.rb
- path for `require` in lib/smolt/cli.rb

## [0.4.3] - 2022-05-28
### Fixed
- the error that is shown when the formula is not found

## [0.4.4] - 2022-05-28
### Fixed
- too many lines in `brew_deps`method
