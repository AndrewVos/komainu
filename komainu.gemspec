# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "komainu/version"

Gem::Specification.new do |s|
  s.name        = "komainu"
  s.version     = Komainu::VERSION
  s.authors     = ["Andrew Vos"]
  s.email       = ["andrew.vos@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{}
  s.description = %q{}

  s.rubyforge_project = "komainu"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest"
  s.add_development_dependency "rake"
  # s.add_runtime_dependency "rest-client"
end
