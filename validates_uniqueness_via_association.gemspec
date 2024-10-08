name = "validates_uniqueness_via_association"
$LOAD_PATH << File.expand_path("../lib", __FILE__)
require "#{name.tr("-", "/")}/version"

Gem::Specification.new name, ValidatesUniquenessViaAssociation::VERSION do |s|
  s.summary = "Validate uniqueness of multiple newly associated records"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib/ bin/ MIT-LICENSE`.split("\n")
  s.license = "MIT"
  s.required_ruby_version = ">= 3.1.0"
  s.add_runtime_dependency "activerecord", ">= 7.0.0", "< 7.3.0"
end
