# -*- encoding: utf-8 -*-
# stub: xcodeproj 1.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "xcodeproj".freeze
  s.version = "1.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Eloy Duran".freeze]
  s.date = "2016-12-19"
  s.description = "Xcodeproj lets you create and modify Xcode projects from Ruby. Script boring management tasks or build Xcode-friendly libraries. Also includes support for Xcode workspaces (.xcworkspace) and configuration files (.xcconfig).".freeze
  s.email = "eloy.de.enige@gmail.com".freeze
  s.executables = ["xcodeproj".freeze]
  s.files = ["bin/xcodeproj".freeze]
  s.homepage = "https://github.com/cocoapods/xcodeproj".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Create and modify Xcode projects from Ruby.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3"])
      s.add_runtime_dependency(%q<CFPropertyList>.freeze, ["~> 2.3.3"])
      s.add_runtime_dependency(%q<claide>.freeze, [">= 1.0.1", "< 2.0"])
      s.add_runtime_dependency(%q<colored>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<nanaimo>.freeze, ["~> 0.2.3"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3"])
      s.add_dependency(%q<CFPropertyList>.freeze, ["~> 2.3.3"])
      s.add_dependency(%q<claide>.freeze, [">= 1.0.1", "< 2.0"])
      s.add_dependency(%q<colored>.freeze, ["~> 1.2"])
      s.add_dependency(%q<nanaimo>.freeze, ["~> 0.2.3"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3"])
    s.add_dependency(%q<CFPropertyList>.freeze, ["~> 2.3.3"])
    s.add_dependency(%q<claide>.freeze, [">= 1.0.1", "< 2.0"])
    s.add_dependency(%q<colored>.freeze, ["~> 1.2"])
    s.add_dependency(%q<nanaimo>.freeze, ["~> 0.2.3"])
  end
end
