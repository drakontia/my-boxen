# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.1"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.7"
github "dnsmasq",     "2.0.2"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.10.0"
github "go",          "2.1.0"
github "homebrew",    "2.1.0"
github "hub",         "1.4.4"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.8.0"
github "nodejs",      "5.0.8"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.6"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

## custmize
#
github "osx",            "2.8.0"

# lib
github "java",           "1.8.4"
github "php",            "2.0.1"
github "libtool",        "1.0.0" # use for php
github "pkgconfig",      "1.0.0" # use for php
github "pcre",           "1.0.0" # use for php
github "libpng",         "1.0.0" # use for php
github "wget",           "1.0.0"
github "imagemagick",    "1.3.0"
github "vagrant",        "3.3.4"
github "qt",             "1.4.0" # use for capybara-webkit
github "zsh",            "1.0.1"
github "heroku",         "2.1.1"
github "mysql",          "2.2.3"
github "postgresql",     "5.0.0"
github "sysctl",         "1.0.1" # use for postgresql
github "redis",          "4.0.2"
github "phantomjs",      "3.0.0"
github "pow",            "2.3.2"

# local application for develop
github "iterm2",         "1.2.5"
github "virtualbox",     "1.0.13"
github "sublime_text_2", "1.1.2"
github "omnigraffle",    "1.3.1"
