$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tkh_content/version"

# Describe your gem and declare its dependencies
Gem::Specification.new do |s|
  s.name        = "tkh_content"
  s.version     = TkhContent::VERSION
  s.authors     = ["Swami Atma"]
  s.email       = ["swamiatma@yoga108.org"]
  s.homepage    = "https://github.com/allesklar/tkh_content"
  s.summary     = "Rails engine running pages and blog posts."
  s.description = "A Rails engine running pages and blog posts in a CMS."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 6.0.0.beta1"
  s.add_dependency 'stringex'
  s.add_dependency "bootstrap-sass"
  # s.add_dependency 'bootstrap-will_paginate'
  s.add_dependency "simple_form"
  s.add_dependency 'globalize'
  s.add_dependency 'will_paginate'
  s.add_dependency 'tkh_activity_feeds'
  s.add_dependency 'tkh_search'

  s.add_development_dependency "sqlite3"
end
