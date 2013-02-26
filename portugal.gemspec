# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'portugal/version'

Gem::Specification.new do |gem|
  gem.name          = "portugal"
  gem.version       = Portugal::VERSION
  gem.authors       = ["Rémi Prévost"]
  gem.email         = ["remi@exomel.com"]
  gem.description   = %q{ActiveRecord migrations without Rails}
  gem.summary       = %q{ActiveRecord migrations without Rails}
  gem.homepage      = "https://github.com/remiprev/portugal"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "activerecord", ">= 3.0.0"
  gem.add_runtime_dependency "rake"

  gem.add_development_dependency "rspec"
end
