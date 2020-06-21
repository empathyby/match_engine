lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'match_engine/version'

Gem::Specification.new do |spec|
  spec.name          = 'match_engine'
  spec.version       = MatchEngine::VERSION
  spec.authors       = ['Dmitry Ilyashevich']
  spec.email         = ['dmitry.ilyashevich@empathy.by']
  spec.summary       = 'Client library for TinEye MatchEngine API.'
  spec.description   = 'Client library for TinEye MatchEngine API.'
  spec.homepage      = 'https://github.com/empathyby/match_engine'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'faraday', '~> 1.0'
  spec.add_dependency 'mimemagic', '~> 0.3'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
end
