class people::ae06710 {
  ## osx
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
  # include postgres
  include java
  include php::5_4_17
  include php::fpm::5_4_17
  php::extension::pgsql { 'pgsql for 5.4.17':
    php => '5.4.17'
  }
  php::extension::pdo_dblib { 'pdo_dblib for 5.4.17':
    php => '5.4.17'
  }
  php::extension::apc { 'apc for 5.4.17':
    php => '5.4.17'
  }
  php::extension::xdebug { 'xdebug for 5.4.17':
    php => '5.4.17'
  }
  include mysql
  include pow
  include wget
  include zsh
  include heroku
  include phantomjs
  phantomjs::version { '1.9.1': }
  include imagemagick

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


  ## application
  # local application for develop
  include postgresapp
  include pgadmin3
  include sequel_pro
  include virtualbox
  include vagrant
  vagrant::plugin { 'vagrant-aws': }
  vagrant::plugin { 'vagrant-berkshelf': }
  # vagrant::box { 'centos64/virtualbox':
  #   source => 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
  # }
  # vagrant::box { 'ubuntu1210/virtualbox':
  #   source => 'http://cloud-images.ubuntu.com/quantal/current/quantal-server-cloudimg-vagrant-amd64-disk1.box'
  # }
  include iterm2::stable
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  include cyberduck
  include firefox
  include chrome

  # local application for utility
  include dropbox
  include skype
  include hipchat
  include alfred
  include mou
  include vlc
  include flux
  include cinch
  include fluid
  include omnigraffle


  # via homebrew
  package {
    [
      'readline', # use for rails
      'tmux',
      'reattach-to-user-namespace', # use tmux to clipbord
      'tree',
      'proctools', # kill by process name. like $ pkill firefox
      'tig',
      'git-extras',
      'z',
      'ec2-api-tools',
      'ec2-ami-tools',
      'coreutils', # change mac command to like GNU Linux
      'putty'
      # 'ghc',
      # 'haskell-platform'
    ]:
  }

  # local application
  package {
    # TODO:if you want to use php. use xhprof for performance check
    'XtraFinder':
      source   => "http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg",
      provider => pkgdmg;
    # 'Language Switcher':
    #   source   => 'http://www.tj-hd.co.uk/downloads/Language_Switcher_1_1_7.dmg',
    #   provider => pkgdmg;
  }


  # dotfile setting
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

  ## composer installing
  # -----
  # TODO: need something solution.
  # boxen use system php version.
  # but composer need php.ini. so we cant install composer 
  # by boxen
  # if i can use `phpenv local 5.4.17`, install composer
  # -----
  #
  # $composer_target_dirs = ["${::boxen_home}/composer",
  #                          "${::boxen_home}/composer/bin"]
  # $composer_target_dir = "${::boxen_home}/composer/bin"
  # $composer_command_name = "composer.phar"

  # file { $composer_target_dirs:
  #   ensure => "directory"
  # }
  # exec { 'composer-install':
  #   command => "curl -sS https://getcomposer.org/installer | php",
  #   cwd     => $composer_target_dir,
  #   creates => "${composer_target_dir}/${composer_command_name}",
  #   unless  => "test -f ${composer_target_dir}/${composer_command_name}",
  #   require => File[$composer_target_dir],
  # }
  # exec { 'composer-fix-permissions':
  #   command => "chmod a+x ${composer_command_name}",
  #   cwd     => $composer_target_dir,
  #   unless  => "test -x ${composer_target_dir}/${composer_command_name}",
  #   require => Exec['composer-install'],
  # }
  # exec { 'composer-update':
  #   command => "${composer_command_name} self-update",
  #   require => Exec['composer-fix-permissions'],
  # }

}
