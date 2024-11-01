Gem::Specification.new do |spec|
  spec.name = "parse_a_changelog"
  # If a "VERSION" file exists (created by Jenkins), use it. Otherwise, use "unreleased".
  spec.version = `if [ -f VERSION ]; then cat < VERSION; else echo "0.0.1-unreleased"; fi`
  spec.authors = ["John Tuttle"]
  spec.email = "jtuttle.develops@gmail.com"
  
  spec.summary = %q{A validator for the keep-a-changelog format}
  spec.description = %q{Uses a grammar describing the keep-a-changelog format to attempt to parse a given file.}
  spec.homepage = "http://github.com/cyberark/parse-a-changelog"
  spec.license = "Apache-2.0"
  
  #spec.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md VERSION)
  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  #spec.files = `git ls-files`.split($\) + %w(LICENSE README.md CHANGELOG.md VERSION)
  spec.bindir = 'bin'
  #spec.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'treetop', '~> 1.6'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.6'
  spec.add_development_dependency 'pry-byebug', '~> 3.10'
end
