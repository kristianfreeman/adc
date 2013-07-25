# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adc/version'

Gem::Specification.new do |spec|
  spec.name          = "adc"
  spec.version       = Adc::VERSION
  spec.authors       = ["Kristian Freeman"]
  spec.email         = ["kristian@kristianfreeman.com"]
  spec.description   = %q{omg is adc up yet}
  spec.summary       = %q{ADC System Status scraper and executable}
  spec.homepage      = "https://github.com/imkmf/adc"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   << 'adc'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
