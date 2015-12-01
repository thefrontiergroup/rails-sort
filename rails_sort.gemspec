# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rails_sort"
  s.version     = "0.1.0"
  s.authors     = ["Jordan Maguire", "Vinicius Osiro"]
  s.email       = ["jordan@thefrontiergroup.com.au", "vinny@thefrontiergroup.com.au"]
  s.homepage    = "https://github.com/thefrontiergroup/rails_sort"
  s.summary     = "Sorting helpers for Rails"
  s.description = <<-EOF
    Provide some view helpers and a sorting object to simplify adding sortable headers in a rails application
  EOF

  s.files         = Dir['README.md', 'lib/**/{*,.[a-z]*}']
  s.require_paths = ["lib"]
end