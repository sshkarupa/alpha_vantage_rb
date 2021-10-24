# frozen_string_literal: true

require_relative "lib/alpha_vantage/version"

Gem::Specification.new do |spec|
  spec.name = "alpha_vantage"
  spec.version = AlphaVantage::VERSION
  spec.authors = ["Sergey Shkarupa"]
  spec.email = ["s.shkarupa@gmail.com"]

  spec.summary = "A gem for Alpha Vantage API"
  spec.description = "A ruby wrapper for Alpha Vantage API"
  spec.homepage = "https://github.com/sshkarupa/alpha_vantage"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.glob("lib/**/*") + Dir.glob("lib/.rbnext/**/*") + Dir.glob("bin/**/*") +
    %w[README.md LICENSE.txt CHANGELOG.md]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # When gem is installed from source, we add `ruby-next` as a dependency
  # to auto-transpile source files during the first load
  if ENV["RELEASING_ALPHAVANTAGE"].nil? && File.directory?(File.join(__dir__, ".git"))
    spec.add_runtime_dependency "ruby-next", "~> 0.13.1"
  else
    spec.add_runtime_dependency "ruby-next-core", "~> 0.13.1"
  end

  spec.add_development_dependency "bundler", ">= 1.0.0"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "webmock", "~> 3.14"
  spec.add_development_dependency "rake", ">= 13.0.0"
  spec.add_development_dependency "ruby-next", "~> 0.13.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
