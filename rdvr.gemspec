# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdvr/version'

Gem::Specification.new do |spec|
  spec.name          = "rdvr"
  spec.version       = Rdvr::VERSION
  spec.authors       = ["Christopher Thielen"]
  spec.email         = ["cthielen@gmail.com"]
  spec.description   = %q{Write a gem description}
  spec.summary       = %q{Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "activerecord", "~> 3.2"
  spec.add_dependency "sqlite3", "~> 1.3"
  spec.add_dependency "whenever", "~> 0.8"
  spec.add_dependency "mechanize", "~> 2.7"
  # spec.add_dependency "taglib-ruby", "~> 0.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
