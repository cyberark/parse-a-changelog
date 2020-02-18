Gem::Specification.new do |s|
  s.name = %q{parse_a_changelog}
  s.version = `cat < VERSION`
  s.authors = ["John Tuttle"]
  s.email = "jtuttle.develops@gmail.com"
  
  s.summary = %q{A validator for the keep-a-changelog format}
  s.description = %q{Uses a grammar describing the keep-a-changelog format to attempt to parse a given file.}
  s.homepage = "http://github.com/cyberark/parse-a-changelog"
  s.license = "Apache-2.0"
  
  s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md VERSION)
  s.bindir = 'bin'
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'treetop', '~> 1.6'
  s.add_development_dependency 'rspec', '~> 3.8'
end
