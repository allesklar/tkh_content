$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tkh_content/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tkh_content"
  s.version     = TkhContent::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TkhContent."
  s.description = "TODO: Description of TkhContent."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.7"

  s.add_development_dependency "sqlite3"
end
