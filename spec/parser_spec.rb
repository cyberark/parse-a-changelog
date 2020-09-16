require_relative '../lib/parse_a_changelog.rb'

describe ParseAChangelog do
  subject(:parser) { ParseAChangelog }

  it "parses a correctly-formatted changelog" do
    expect(parser.parse("spec/fixtures/correct.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses an initial release tag link" do
    expect(parser.parse("spec/fixtures/correct_initial_tag.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses an empty unreleased section" do
    expect(parser.parse("spec/fixtures/correct_empty_unreleased.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses an empty diff section" do
    expect(parser.parse("spec/fixtures/correct_empty_diff.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses a changelog with no releases" do
    expect(parser.parse("spec/fixtures/no_releases.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses a changelog with https header links" do
    expect(parser.parse("spec/fixtures/correct_https.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses a changelog with a release candidate version" do
    expect(parser.parse("spec/fixtures/correct_with_pre_release.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "errors on malformed changelog header" do
    expect {
      parser.parse("spec/fixtures/malformed_changelog_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 4/)
  end

  it "errors on malformed unreleased header" do
    expect {
      parser.parse("spec/fixtures/malformed_unreleased_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 7/)
  end

  it "errors on malformed release header" do
    expect {
      parser.parse("spec/fixtures/malformed_release_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 14/)
  end

  # TODO: this may be too strict as keep-a-changelog doesn't require semver.
  it "errors on malformed release version" do
    expect {
      parser.parse("spec/fixtures/malformed_release_version.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 14/)
  end

  # TODO: this maybe be too strict as keep-a-changelog doesn't specify.
  it "errors on incorrect releaser header delimiter" do
    expect {
      parser.parse("spec/fixtures/incorrect_release_header_delimiter.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 18/)
  end

  it "errors on release header with missing release date" do
    expect {
      parser.parse("spec/fixtures/missing_release_date.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 18/)
  end

  it "errors on malformed release date" do
    expect {
      parser.parse("spec/fixtures/malformed_release_date.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 14/)
  end

  it "errors on malformed change header" do
    expect {
      parser.parse("spec/fixtures/malformed_change_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 15/)
  end

  it "errors on unknown change type" do
    expect {
      parser.parse("spec/fixtures/unknown_change_type.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 19/)
  end

  it "errors on incorrect change prefix" do
    expect {
      parser.parse("spec/fixtures/incorrect_change_prefix.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 12/)
  end

  it "errors on missing newline at end of file" do
    expect {
      parser.parse("spec/fixtures/missing_newline_at_eof.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 31/)
  end

  it "errors on missing newline before unreleased section" do
    expect {
      parser.parse("spec/fixtures/missing_newline_before_unreleased.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 6/)
  end

  it "errors on missing newline before releases sections" do
    expect {
      parser.parse("spec/fixtures/missing_newline_before_releases.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 13/)
  end

  it "errors on missing newline between change sections" do
    expect {
      parser.parse("spec/fixtures/missing_newline_between_changes.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 10/)
  end

  it "errors on missing newline before diff sections" do
    expect {
      parser.parse("spec/fixtures/missing_newline_before_diffs.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 29/)
  end

  it "errors on malformed diff version" do
    expect {
      parser.parse("spec/fixtures/malformed_diff_version.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 10/)
  end
end
