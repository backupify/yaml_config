# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml_config/version'

Gem::Specification.new do |spec|
  spec.name          = "yaml_config"
  spec.version       = YamlConfig::VERSION
  spec.authors       = ["Jason Haruska", "Matt Conway"]
  spec.email         = ["jason@backupify.com", "matt@conwaysplace.com"]
  spec.description   = %q{Reads in multiple yml files and makes them available to the rest of the project}
  spec.summary       = %q{Reads in multiple yml files and makes them available to the rest of the project}
  spec.homepage      = "http://github.com/backupify/yaml_config"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rdoc"
  spec.add_dependency "activesupport"
  spec.add_dependency "hashie"
end

