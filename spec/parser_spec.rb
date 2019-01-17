require_relative '../lib/parser.rb'

describe ParseAChangelog::Parser do
  let(:subject) { ParseAChangelog::Parser }
  
  it "parses a correctly-formatted changelog" do
    expect(subject.parse("spec/fixtures/correct.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses an empty unreleased section" do
    expect(subject.parse("spec/fixtures/correct_empty_unreleased.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end
  
  # TODO: spec may not allow empty date, might have to enforce presence by
  # default with option to turn it off.
  it "parses a release header with a missing release date" do
    expect(subject.parse("spec/fixtures/correct_missing_release_date.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)
  end

  it "parses an empty diff section" do
    expect(subject.parse("spec/fixtures/correct_empty_diff.md")).
      to be_an_instance_of(Treetop::Runtime::SyntaxNode)    
  end

  it "errors on malformed changelog header" do
    expect {
      subject.parse("spec/fixtures/malformed_changelog_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 4/)
  end

  it "errors on malformed unreleased header" do
    expect {
      subject.parse("spec/fixtures/malformed_unreleased_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 7/)
  end

  it "errors on malformed release header" do
    expect {
      subject.parse("spec/fixtures/malformed_release_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 14/)
  end

  # TODO: this may be too strict, don't think keep-a-changelog requires semver.
  it "errors on malformed release version" do
    expect {
      subject.parse("spec/fixtures/malformed_release_version.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 14/)
  end

  it "errors on malformed release date" do
    expect {
      subject.parse("spec/fixtures/malformed_release_date.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 14/)
  end

  it "errors on malformed change header" do
    expect {
      subject.parse("spec/fixtures/malformed_change_header.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 15/)
  end
  
  it "errors on unknown change type" do
    expect {
      subject.parse("spec/fixtures/unknown_change_type.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 19/)
  end

  it "errors on incorrect change prefix" do
    expect {
      subject.parse("spec/fixtures/incorrect_change_prefix.md")
    }.to raise_error(ParseAChangelog::ParseError, /line 12/)
  end
end
