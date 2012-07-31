$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tkh_content/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tkh_content"
  s.version     = TkhContent::VERSION
  s.authors     = ["Swami Atma"]
  s.email       = ["swami@TenThousandHours.eu"]
  s.homepage    = "http://TenThousandHours.eu"
  s.summary     = "Rails engine running pages and blog posts."
  s.description = "A Rails engine running pages and blog posts in a CMS."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency 'stringex', '~> 1.4'
  s.add_dependency "simple_form", "~> 2.0"
  s.add_dependency 'globalize3', '~> 0.2'

  s.add_development_dependency "sqlite3"
end
