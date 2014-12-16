# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'type_constraints/version'

Gem::Specification.new do |spec|
  spec.name          = "type_constraints"
  spec.version       = TypeConstraints::VERSION
  spec.authors       = ["hisaichi5518"]
  spec.email         = ["hisaichi5518@gmail.com"]
  spec.summary       = %q{Type constraint system for Ruby}
  spec.description   = %q{Type constraint system for Ruby}
  spec.homepage      = "https://github.com/hisaichi5518/type_constraints"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
