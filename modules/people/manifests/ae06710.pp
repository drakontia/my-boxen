class people::ae06710 {

  ## osx
  #
  # Finder
  include osx::finder::unhide_library
  class osx::finder::show_all_files {
    include osx::finder
    boxen::osx_defaults { 'Show all files':
      user   => $::boxen_user,
      domain => 'com.apple.finder',
      key    => 'AppleShowAllFiles',
      value  => true,
      notify => Exec['killall Finder'];
    }
  }
  include osx::finder::show_all_files

  # Dock
  include osx::dock::autohide
  class osx::dock::kill_dashbord{
    include osx::dock
    boxen::osx_defaults { 'kill dashbord':
      user   => $::boxen_user,
      domain => 'com.apple.dashboard',
      key    => 'mcx-disabled',
      value  => YES,
      notify => Exec['killall Dock'];
    }
  }
  include osx::dock::kill_dashbord

  # Universal Access
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom

  # Miscellaneous
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  include osx::software_update # download and install software updates


  ## lib
  #
  include postgresql
  include java
  include php::5_4_17
  # include php::fpm::5_4_17
  # php::extension::pgsql { 'pgsql for 5.4.17':
  #   php => '5.4.17'
  # }
  # php::extension::pdo_dblib { 'pdo_dblib for 5.4.17':
  #   php => '5.4.17'
  # }
  # php::extension::apc { 'apc for 5.4.17':
  #   php => '5.4.17'
  # }
  # php::extension::xdebug { 'xdebug for 5.4.17':
  #   php => '5.4.17'
  # }
  include mysql
  include redis
  include wget
  include zsh
  include imagemagick
  include phantomjs
  phantomjs::version { '1.9.2': }
  include heroku

  # ruby
  ruby::gem { "git-issue for 2.0.0-p247":
    gem     => 'git-issue',
    ruby    => '2.0.0-p247'
  }
  ruby::gem { "chef for 2.0.0-p247":
    gem     => 'chef',
    ruby    => '2.0.0-p247'
  }
  ruby::gem { "knife-solo for 2.0.0-p247":
    gem     => 'knife-solo',
    ruby    => '2.0.0-p247'
  }
  ruby::gem { "rubocop for 2.0.0-p247":
    gem     => 'rubocop',
    ruby    => '2.0.0-p247'
  }


  ## local application for develop
  #
  # include postgresapp
  include pgadmin3
  include sequel_pro
  include virtualbox
  include vagrant
  vagrant::plugin { 'vagrant-aws': }
  vagrant::plugin { 'vagrant-berkshelf': }
  vagrant::plugin { 'vagrant-omnibus': }
  include iterm2::stable
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  include cyberduck
  include firefox
  include chrome

  ## local application for utility
  #
  include dropbox
  include skype
  include hipchat
  include alfred
  include mou
  include vlc
  include flux
  include cinch
  include fluid

  ## via homebrew
  #
  homebrew::tap { 'homebrew/binary': }
  package {
    [
      'readline',                   # use for ruby compile
      'coreutils',                  # change mac command to like GNU Linux
      'tree',                       # linux tree cmd
      'z',                          # shortcut change dir
      'the_silver_searcher',        # alternative grep
      'proctools',                  # kill by process name. like $ pkill firefox
      'graphviz',                   # graph generator (use for rails-erd)
      'ctags',                      # vim compel
      'tmux',                       # terminal session
      'tig',                        # git cui client
      'git-extras',                 # git command extend
      'reattach-to-user-namespace', # use tmux to clipbord
      'ec2-api-tools',              # aws cli tools
      'ec2-ami-tools',              # aws cli tools
      'putty',                      # use convert ppk key to OpenSSH format
      'packer'                      # vagrant box maker
      # 'ghc',
      # 'haskell-platform'
    ]:
  }

  ## dotfile setting
  #
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'ae06710/dotfiles'
  }
  exec { "dotfile-setup":
    cwd => $dotfiles,
    command => 'sh ${dotfiles}/setup.sh',
    creates => "${home}/.zshrc",
    require => Repository[$dotfiles],
    notify  => Exec['dotfile-submodule-update'],
  }
  exec { "dotfile-submodule-update":
    cwd => $dotfiles,
    command => 'git submodule init && git submodule update',
    creates => "${dotfiles}/antigen/.env",
  }
}
