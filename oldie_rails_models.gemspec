$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "oldie_rails_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "oldie_rails_models"
  s.version     = OldieRailsModels::VERSION
  s.authors     = ["Alex Dubovskoy"]
  s.email       = ["dubovskoy.a@gmail.com"]
  s.homepage    = "https://github.com/dubadub/oldie_rails_models"
  s.summary     = "Basic support of Rails 2 models in Rails 4."
  s.description = "Basic support of Rails 2 models in Rails 4."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

end
