# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beer_advocate/version'

Gem::Specification.new do |spec|
  spec.name          = "beer_advocate"
  spec.version       = BeerAdvocate::VERSION
  spec.authors       = ["'Michael Ries'"]
  spec.email         = ["'michael.ries@gmail.com'"]

  spec.summary       = "Beer Advocate's Top Ten of All Time"
  spec.description   = "Information on the to 10 beers in the world as ranked by beeradvocate.com."
  spec.homepage      = "https://github.com/mikeries/beer-advocate.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry'

  spec.add_dependency 'nokogiri'
  spec.add_dependency "terminal-table", "~>1.7"
  spec.add_dependency "colorize", "~>0.8"
end
