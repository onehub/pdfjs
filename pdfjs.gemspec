$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pdfjs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pdfjs"
  s.version     = Pdfjs::VERSION
  s.authors     = ["Leigh Caplan"]
  s.email       = ["lcaplan@onehub.com"]
  s.homepage    = "https://github.com/onehub/pdfjs"
  s.summary     = "Package pdfjs for your Rails apps."
  s.description = "Package pdfjs for your Rails apps."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.2"

  s.add_development_dependency "sqlite3"
end
