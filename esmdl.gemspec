# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esmdl/version'

Gem::Specification.new do |spec|
  spec.name          = "esmdl"
  spec.version       = Esmdl::VERSION
  spec.authors       = ["Ian Dillon"]
  spec.email         = ["dillon@etsu.edu"]

  spec.description   = %q{A simplified CLI interface for the download functionality of Ellucian Solution Manager}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/ian-d/esmdl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["esmdl"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", ">= 0.19.1"
  spec.add_runtime_dependency "ruby-progressbar", ">= 1.8.1"
  spec.add_runtime_dependency "filesize", ">= 0.1.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
