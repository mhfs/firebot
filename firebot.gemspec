# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "firebot/version"

Gem::Specification.new do |s|
  s.name        = "firebot"
  s.version     = Firebot::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcelo Silveira"]
  s.email       = "marcelo@mhfs.com.br"
  s.homepage    = "https://github.com/mhfs/firebot"
  s.summary     = "Extensible Campfire bot to integrate with other applications/services"
  s.description = "Extensible Campfire bot to integrate with other applications/services"

  s.rubyforge_project = "firebot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "twitter-stream", "~> 0.1.10"
  s.add_dependency "faraday",        "~> 0.5.7"
  s.add_dependency "yajl-ruby",      "~> 0.8.1"
  s.add_dependency "daemons",        "~> 1.1.0"
  s.add_dependency "thor",           "~> 0.14.6"

  s.add_development_dependency "rspec", "~> 2.5.0"
  s.add_development_dependency "fakeweb", "~> 1.3.0"
end
