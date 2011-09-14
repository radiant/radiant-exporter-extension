# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-exporter-extension/version"

Gem::Specification.new do |s|
  s.name        = "radiant-exporter-extension"
  s.version     = RadiantExporterExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Radiant CMS Dev Team"]
  s.email       = ["radiant@radiantcms.org"]
  s.homepage    = "http://radiantcms.org/"
  s.summary     = %q{Export your models from Radiant}
  s.description = %q{Export your models from Radiant}

  ignores = if File.exist?(".gitignore")
    File.read(".gitignore").split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir["**/*"] - ignores
  s.test_files    = Dir["test/**/*","spec/**/*","features/**/*"] - ignores
  s.require_paths = ["lib"]
end
