# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pandora/version'

Gem::Specification.new do |spec|
  spec.name          = "pandora-frameworks"
  spec.version       = Pandora::VERSION
  spec.authors       = ["Pedro Piñera Buendía"]
  spec.email         = ["pepibumur@gmail.com"]
  spec.summary       = %q{Tool for automating frameworks creation & integration}
  spec.homepage      = "http://frameworkoriented.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'git', '~> 1.3'
  spec.add_dependency 'xcodeproj', '~> 1.3'
  spec.add_dependency "rest-client", '~> 2.0'
  spec.add_dependency "rubyzip", "~> 1.2"
  spec.add_dependency "colorize", "~> 0.8"

  spec.add_development_dependency 'maxitest', '~> 2.2'
  spec.add_development_dependency 'shoulda-context', "~> 1.2"
  spec.add_development_dependency 'coveralls', "~> 0.8"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
end
