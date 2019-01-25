Gem::Specification.new do |s|
  s.name = %q{parse_a_changelog}
  s.version = `cat < VERSION`
  s.authors = ["John Tuttle"]
  s.email = "jtuttle.develops@gmail.com"
  
  s.summary = %q{A validator for the keep-a-changelog format}
  s.description = %q{A validator for the keep-a-changelog format}
  s.homepage = "http://github.com/cyberark/parse-a-changelog"
  s.license = "Apache-2.0"
  
  s.files = [
    "bin/parse",
    "lib/parse_a_changelog.rb"
  ]
  s.require_paths = ["lib"]
end
