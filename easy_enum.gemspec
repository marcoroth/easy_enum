# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'easy_enum/version'

Gem::Specification.new do |spec|
  spec.name          = 'easy_enum'
  spec.version       = EasyEnum::VERSION
  spec.authors       = ['Marco Roth']
  spec.email         = ['marco.roth@intergga.ch']
  spec.summary       = 'Turn any Ruby class in an easy to use enum'
  spec.description   = 'Turn any Ruby class in an easy to use enum'
  spec.homepage      = 'https://github.com/marcoroth/easy_enum'
  spec.license       = 'MIT'
  spec.files         = Dir['{lib}/**/*', 'LICENSE.txt', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.5.2'
end
