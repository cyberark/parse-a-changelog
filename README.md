# parse-a-changelog

This gem can be used to validate that a file conforms to the [Keep a Changelog](https://keepachangelog.com) standard. It does this by defining a Keep a Changelog [grammar](https://github.com/cyberark/parse-a-changelog/blob/master/lib/grammar.tt) and using the [treetop parsing DSL](https://github.com/cjheath/treetop) to parse a changelog file according to that grammar.

## Usage

Add `parse_a_changelog` to your `Gemfile` and `bundle install` or install it directly with:

```
gem install parse_a_changelog
```

The gem includes a binary that can be run with the changelog file as its single argument:

```
parse path/to/changelog
```

Or you can use the gem directly in your Ruby code:

```
result = ParseAChangelog::parse("path/to/changelog")
```

Finally, here is an example bash script that runs `parse-a-changelog` on the current directory in a Docker container, which can be useful for including changelog validation in a CI pipeline:

```
#!/bin/bash -ex

docker run \
  --rm \
  --volume "${PWD}/CHANGELOG.md":/CHANGELOG.md \
  cyberark/parse-a-changelog
```

# Development

We welcome contributions of all kinds to `parse-a-changelog`. See our [contributing guide](CONTRIBUTING.md).

# Testing

Make sure you have the `rspec` gem installed in your current gem set then run the tests like so:

```
$ rspec
..................

Finished in 0.02494 seconds (files took 0.21634 seconds to load)
18 examples, 0 failures
```

# Releasing

1. Create a branch
1. Determine the appropriate version using [semver](https://semver.org/) and update the `VERSION` file.
1. Move the contents of the Unreleased section in `CHANGELOG.md` into a new section using the current release version and date.
1. Update the links at the bottom of `CHANGELOG.md`.
1. Commit these changes with a commit message about bumping the version.
1. Run `git tag <release-version> && git push origin --tags`
1. Create a PR to have the release approved and merged.
1. Build the gem: `gem build parse_a_changelog.gemspec`
1. Push the gem: `gem push parse_a_changelog-<release-version>.gem` (this may require [setting up publishing credentials](https://guides.rubygems.org/publishing/))

# License

The parse-a-changelog gem is licensed under Apache License 2.0 - see [`LICENSE`](LICENSE) for more details.
