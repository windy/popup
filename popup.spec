# -*- encoding: utf-8 -*-
require "#{File.expand_path('..',__FILE__)}/lib/popup/version"
Gem::Specification.new do |s|
  s.name = %q{popup}
  s.version = ATT::Popup::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["yafei Li"]
  s.date = %q{2011-09-08}
  s.description = %q{popup operation for all windows version.}
  s.summary = %q{popup operation for all windows version.}
  s.email = %q{lyfi2003@gmail.com}
  s.files = Dir.glob("lib/**/*")
  s.files += Dir.glob("spec/**/*")
  s.files += Dir.glob("support/**/*")
  s.files += ["Rakefile","README.md"]
  s.homepage = %q{https://github.com/windy/popup}
  s.require_paths = ["lib"]
  s.add_dependency(%q<rautomation>)
  s.add_dependency(%q<ffi>)
end
