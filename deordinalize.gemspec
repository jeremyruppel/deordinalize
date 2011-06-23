# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "deordinalize/version"

Gem::Specification.new do |s|
  s.name        = "deordinalize"
  s.version     = Deordinalize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jeremy Ruppel"]
  s.email       = ["jeremy.ruppel@gmail.com"]
  s.homepage    = "https://github.com/jeremyruppel/deordinalize"
  s.summary     = %q{Small gem to 'deordinalize' strings into the integers they reference.}
  s.description = %q{Small gem to 'deordinalize' strings into the integers they reference. Intended to be hella useful in cucumber steps.}

  s.rubyforge_project = "deordinalize"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "linguistics"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
