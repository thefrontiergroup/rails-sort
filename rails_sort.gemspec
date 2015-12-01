# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rails_sort"
  s.version     = "1.0.0"
  s.authors     = ["Jordan Maguire"]
  s.email       = ["jordan@thefrontiergroup.com.au"]
  s.homepage    = "https://github.com/thefrontiergroup/rails_sort"
  s.summary     = "Sorting helpers for Rails"
  s.description = " Provide some view helpers and a sorting object to simplify adding sortable headers in a rails application"
  s.files         = Dir['README.md', 'lib/**/{*,.[a-z]*}']
  s.require_paths = ["lib"]
end
