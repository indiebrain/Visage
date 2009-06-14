# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{visage}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ed Schmalzle", "Aaron Kuehler"]
  s.date = %q{2009-06-14}
  s.default_executable = %q{visage}
  s.email = %q{Jonas714@gmail.com}
  s.executables = ["visage"]
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "README",
     "Rakefile",
     "VERSION.yml",
     "Visage.gemspec",
     "bin/visage",
     "lib/visage.rb",
     "lib/visage/converter.rb",
     "lib/visage/iso.rb",
     "visage.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/nerdEd/visage}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Utility for converting .cdr and .dvdmedia files to .iso files}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
