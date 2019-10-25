# parse-a-changelog

This gem can be used to validate that a file conforms to the [Keep a Changelog](https://keepachangelog.com) standard. It does this by defining a Keep a Changelog [grammar](https://github.com/cyberark/parse-a-changelog/blob/master/lib/grammar.tt) and using the [treetop parsing DSL](https://github.com/cjheath/treetop) to parse a changelog file according to that grammar.

## Usage

Add `parse-a-changelog` to your `Gemfile` and `bundle install` or install it directly with:

```
gem install parse-a-changelog
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

docker run --rm -v "$PWD":/app ruby:2.6 bash -ec "
  gem install parse_a_changelog
  parse /app/CHANGELOG.md
"
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

# License

The parse-a-changelog gem is licensed under Apache License 2.0 - see [`LICENSE`](LICENSE) for more details.
