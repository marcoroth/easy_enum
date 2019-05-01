lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simple_enum/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_enum'
  spec.version       = SimpleEnum::VERSION
  spec.authors       = ['Marco Roth']
  spec.email         = ['marco.roth@intergga.ch']
  spec.summary       = 'Easy to use enums in Ruby'
  spec.description   = 'Easy to use enums in Ruby'
  spec.homepage      = 'https://github.com/marcoroth/simple_enum'
  spec.license       = 'MIT'
  spec.files         = Dir['{lib}/**/*', 'LICENSE.txt', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
