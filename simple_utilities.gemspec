# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'simple_utilities'
  s.version     = '0.0.1'
  s.summary     = 'Hola!'
  s.description = 'A simple utility gem'
  s.authors     = ['Shams Baig']
  s.email       = 'baig.shams@gmail.com'
  s.files       = ['README.md', 'lib/simple_utilities.rb']
  s.add_dependency 'activesupport', '6.1.3.2'
  s.homepage    =
    'https://github.com/rubymaniac2012'
  s.license = 'SB'

  s.add_development_dependency 'rspec', '3.10.0'
  s.add_development_dependency 'rspec-expectations', '3.10.1'
end
