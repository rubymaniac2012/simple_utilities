# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'simple_utilities'
  s.version     = '0.0.2'
  s.summary     = 'Hola!'
  s.description = 'A simple utility gem'
  s.authors     = ['Shams Baig']
  s.email       = 'baig.shams@gmail.com'
  s.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.add_dependency 'activesupport', '>= 5.2.6'
  s.require_paths = ['lib']
  s.homepage =
    'https://github.com/rubymaniac2012'
  s.license = 'SB'
  s.required_ruby_version = '>= 2.5.0'
  s.add_development_dependency 'rspec', '3.10.0'
  s.add_development_dependency 'rspec-expectations', '3.10.1'
end
