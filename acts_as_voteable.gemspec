# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "acts_as_voteable"
  s.version     = "0.0.3"
  s.platform    = Gem::Platform::RUBY  
  s.summary     = "Allows user to vote on the on models."
  s.email       = "TechKnow@juixe.com"
  s.homepage    = "http://juixe.com/techknow/index.php/2006/06/24/acts-as-voteable-rails-plugin/"
  s.description = "Allows user to vote on the on models."
  s.authors     = ['TechKnow']

  s.rubyforge_project = "acts_as_voteable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.add_dependency("rails", "~> 3.0")
end
