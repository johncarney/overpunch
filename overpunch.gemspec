# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'overpunch/version'

Gem::Specification.new do |spec|
  spec.name          = "overpunch"
  spec.version       = Overpunch::VERSION
  spec.authors       = ["John Carney"]
  spec.email         = ["john@carney.id.au"]
  spec.summary       = %q{Parses and formats numbers in signed overpunch format.}
  spec.description   = %q{Simple module for parsing and formatting numbers in signed overpunch format.}
  spec.homepage      = "https://github.com/johncarney/overpunch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
end
