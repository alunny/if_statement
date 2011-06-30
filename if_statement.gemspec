# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "if_statement/version"

Gem::Specification.new do |s|
  s.name        = "if_statement"
  s.version     = IfStatement::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Lunny"]
  s.email       = ["alunny@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/if_statement"
  s.summary     = %q{Dumb Rails Feature Flipper}
  s.description = %q{A feature flipper. Designed to be a Rails plugin}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.6.0"
end
