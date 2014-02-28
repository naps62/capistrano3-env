# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-dotenv"
  gem.version       = '0.1.0'
  gem.authors       = ["Miguel Palhas"]
  gem.email         = ["mpalhas@gmail.com"]
  gem.description   = %q{Dotenv integration for Capistrano 3}
  gem.summary       = %q{Dotenv integration for Capistrano 3}
  gem.homepage      = "https://github.com/naps62/capistrano-dotenv"
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'
end
