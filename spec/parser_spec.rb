require_relative '../lib/parser.rb'

describe ParseAChangelog::Parser do


  it "parses a correctly-formatted changelog" do
    puts Dir.pwd
    ParseAChangelog::Parser.parse("spec/fixtures/changelog_correct.md")
  end
end
