# frozen_string_literal: true

require_relative "lib/AdventOfCode2022/version"

Gem::Specification.new do |spec|
  spec.name          = "AdventOfCode2022"
  spec.version       = AdventOfCode2022::VERSION
  spec.authors       = ["Andre LaFleur"]
  spec.email         = ["cincospenguinos@gmail.com"]

  spec.summary       = "Advent of code code for 2022"
  spec.description   = "My solutions to Advent of Code 2022"
  spec.homepage      = "https://github.com/cincospenguinos/AdventOfCode2022"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cincospenguinos/AdventOfCode2022"
  spec.metadata["changelog_uri"] = "https://github.com/cincospenguinos/AdventOfCode2022"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
