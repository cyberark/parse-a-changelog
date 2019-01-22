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