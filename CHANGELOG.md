# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.4] - 2025-10-16
### Changed
- Updated documentation to align with Conjur Enterprise name change to Secrets Manager. (CNJR-11000)

## [1.3.3] - 2024-11-08
### Changed
- Decrease Docker image size by using ruby:3-alpine base image (CNJR-5578)

## [1.3.2] - 2024-11-05
### Changed
- Use internal auto release process (CNJR-5578)

## [1.3.0] - 2023-12-28
### Changed
- Allow versions to have 4 digits (eg., x.x.x.x)
  [cyberark/parse-a-changelog#41](https://github.com/cyberark/parse-a-changelog/pulls/41)

### Security
- Updated Dockerfile base image to use latest Ruby v3 version
  [cyberark/parse-a-changelog#46](https://github.com/cyberark/parse-a-changelog/pulls/46)

## [1.2.0] - 2021-06-20
### Changed
- Allow CHANGELOG without SemVer declaration.
  [cyberark/parse-a-changelog#37](https://github.com/cyberark/parse-a-changelog/issues/37)

## [1.1.0] - 2020-11-12
### Added
- Allow for metadata section in version string.
  [cyberark/parse-a-changelog#34](https://github.com/cyberark/parse-a-changelog/issues/34)

## [1.0.2] - 2020-08-26
### Fixed
- Added support for semver pre-releases.
  [cyberark/parse-a-changelog#29](https://github.com/cyberark/parse-a-changelog/issues/29).

## [1.0.1] - 2020-03-06
### Added
- Jenkins pipeline with ruby gems publication
- Test and Publish scripts

### Changed
- Allow https in header links

### Removed
- Gitlab CI support

## [1.0.0] - 2019-01-30
### Added
- Missing (optional) initial release tag link as last entry in links section to the grammar
- Release instructions

## [0.2.3] - 2019-01-30
### Fixed
- Include tt extension when requiring grammar

## [0.2.2] - 2019-01-30
### Fixed
- Use require to load grammar to remove pathing problems

## [0.2.1] - 2019-01-30
### Added
- Missing gemspec files
- Gemspec executable metadata

### Changed
- Move dependencies to gemspec

### Removed
- Gemfile.lock from source control

## [0.2.0] - 2019-01-25
### Added
- Gitlab pipeline configuration
- Dockerfile (currently for manual usage)
- CI pipeline validates changelog
- Binary file to gemspec

## [0.1.2] - 2019-01-23
### Changed
- Version bump to replace yanked previous version

## [0.1.1] - 2019-01-23
### Removed
- Fixed incorrect Ruby file name in binary

## [0.1.0] - 2019-01-23
### Added
- First draft of the Keep A Changelog parser
- Open source license and contributing information
- Change log and versioning information

[Unreleased]: https://github.com/cyberark/parse-a-changelog/compare/v1.3.4...HEAD
[1.3.4]: https://github.com/cyberark/parse-a-changelog/compare/v1.3.3...v1.3.4
[1.3.3]: https://github.com/cyberark/parse-a-changelog/compare/v1.3.2...v1.3.3
[1.3.2]: https://github.com/cyberark/parse-a-changelog/compare/v1.3.0...v1.3.2
[1.3.0]: https://github.com/cyberark/parse-a-changelog/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/cyberark/parse-a-changelog/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/cyberark/parse-a-changelog/compare/v1.0.2...v1.1.0
[1.0.2]: https://github.com/cyberark/parse-a-changelog/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/cyberark/parse-a-changelog/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/cyberark/parse-a-changelog/compare/v0.2.3...v1.0.0
[0.2.3]: https://github.com/cyberark/parse-a-changelog/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/cyberark/parse-a-changelog/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/cyberark/parse-a-changelog/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/cyberark/parse-a-changelog/compare/v0.1.2...v0.2.0
[0.1.2]: https://github.com/cyberark/parse-a-changelog/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/cyberark/parse-a-changelog/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/cyberark/parse-a-changelog/releases/tag/v0.1.0
