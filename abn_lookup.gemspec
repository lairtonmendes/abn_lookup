# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "abn_lookup/version"

Gem::Specification.new do |spec|
  spec.name = "abn_lookup"
  spec.version = AbnLookup::VERSION
  spec.authors = ["Lairton Mendes"]
  spec.email = ["lairton.mendes@gmail.com"]

  spec.summary = "Abn Lookup."
  # spec.description = "TODO: Write a longer description or delete this line."

  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["source_code_uri"] = "https://github.com/lairtonmendes/abn_lookup"
  spec.metadata["changelog_uri"] = "https://github.com/lairtonmendes/abn_lookup/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday", "~> 0.13"
  spec.add_dependency "faraday_middleware", "~> 0.14"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
