
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hnjobs/version"

Gem::Specification.new do |spec|
  spec.name          = "hnjobs_cli"
  spec.version       = Hnjobs::VERSION
  spec.authors       = ["purple squirrel"]
  spec.email         = ["mikkanthrope@gmail.com"]

  spec.summary       = %q{Extracts job postings from Ycombinator Hacker News}
  spec.description   = %q{CLI app for checking monthly job postings on Ask HN: Who Is Hiring}
  spec.homepage      = "https://github.com/squirrelnest/hnjobs_cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "bin"
  spec.executables   = ["hnjobs_cli"]
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"

end
