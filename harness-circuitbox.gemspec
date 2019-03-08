lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "harness/circuitbox/version"

Gem::Specification.new do |spec|
  spec.name          = "harness-circuitbox"
  spec.version       = Harness::Circuitbox::VERSION
  spec.authors       = ["Steve Newell"]
  spec.email         = ["newellista@gmail.com"]

  spec.summary       = %q{Forward Circuitbox's internal metrics to Harness}
  spec.description   = %q{Forward Circuitbox's internal metrics to Harness.}
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/newellista/harness-circuitbox"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

  spec.add_development_dependency "harness", ">= 2.0.0"
  spec.add_development_dependency "pry"
end
