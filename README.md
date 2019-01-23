# parse-a-changelog

This gem uses the [treetop parsing DSL](https://github.com/cjheath/treetop) to
parse changelogs that use the [Keep a Changelog](https://keepachangelog.com)
standard.

## Usage

Add `parse-a-changelog` to your Gemfile and `bundle install` or install directly with:

```
gem install parse-a-changelog
```

The gem can then be used via CLI:

```
parse path/to/changelog
```

Or it can be used directly in your Ruby code:

```
result = ParseAChangelog::parse("path/to/changelog")
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

The parse-a-changelog gem is licensed under Apache License 2.0 - see [`LICENSE.md`](LICENSE.md) for more details.