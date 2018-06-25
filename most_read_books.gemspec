
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "most_read_books/version"

Gem::Specification.new do |spec|
  spec.name          = "most_read_books"
  spec.version       = MostReadBooks::VERSION
  spec.authors       = ["'Kayla Ochoa'"]
  spec.email         = ["'ochoa.kayla@yahoo.com'"]

  spec.summary       = %q{CLI for displaying the top 50 most read books this week as well as their ratings, and book synopsis}
  spec.description   = %q{CLI that displays this week's top 50 most read books. Scrapes Goodreads to view (https://www.goodreads.com/book/most_read), a social cataloging website that allows individuals to search for books, annotations, and reviews. }
  spec.homepage      = "https://github.com/kochoa76/Most-read-books-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["most-read-books"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "gem-release"
  spec.add_dependency "nokogiri"

end
