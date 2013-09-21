# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0" # via homebrew
github "gcc",        "2.0.1" # via homebrew
github "git",        "1.2.5" # via homebrew
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2" # via homebrew
github "nodejs",     "3.2.9" 
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

## custmize
#
github "osx",            "1.6.0"

# lib
github "java",           "1.1.0"
github "php",            "1.1.1" # , :repo => "ae06710/puppet-php"
github "libtool",        "1.0.0" # use for php
github "pkgconfig",      "1.0.0" # use for php
github "pcre",           "1.0.0" # use for php
github "libpng",         "1.0.0" # use for php
github "wget",           "1.0.0" # via homebrew
github "zsh",            "1.0.0" # via homebrew
github "heroku",         "2.0.0"
github "mysql",          "1.1.0" # via homebrew
github "postgresql",     "2.0.0" # via homebrew
github "phantomjs",      "2.0.2" # via homebrew
github "imagemagick",    "1.2.0" # via homebrew
github "qt",             "1.0.1" # use for capybara-webkit
github "pow",            "1.0.0"


# local application for develop
github "postgresapp",    "1.0.0"
github "pgadmin3",       "1.0.0"
github "sequel_pro",     "1.0.0"
github "iterm2",         "1.0.3"
github "virtualbox",     "1.0.5"
github "vagrant",        "2.0.10"
github "sublime_text_2", "1.1.2"
github "chrome",         "1.1.0"
github "firefox",        "1.1.1"
github "cyberduck",      "1.0.1"
github "omnigraffle",    "1.2.0"

# local application for utility
github "dropbox",        "1.1.0"
github "skype",          "1.0.2"
github "hipchat",        "1.0.7"
github "alfred",         "1.1.4"
github "mou",            "1.1.3"
github "vlc",            "1.0.3"
github "flux",           "1.0.0"
github "cinch",          "1.0.0"
github "fluid",          "1.0.0"
github "omnigraffle",    "1.2.0" 

