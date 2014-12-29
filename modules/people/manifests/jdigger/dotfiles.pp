# == Description
#
# "Dot files" for BaseBox.org (aka "baseboxorg").
#
# == Assumptions
#
# The .zshenv template assumes that the 'github_token' fact has been set.
# In Boxen, this is typically done in ~/.boxen/config.json
#
class people::baseboxorg::dotfiles {
  include git

  $home = "/Users/${::boxen_user}"

  repository { 'oh-my-zsh' :
    source => 'https://github.com/baseboxorg/oh-my-zsh.git',
    path   => "${home}/.oh-my-zsh",
  }

  file { "${home}/.zshrc":
    source => 'puppet:///modules/people/baseboxorg/zshrc',
  }

  file { "${home}/.zshenv":
    content => template('people/baseboxorg/zshenv.erb')
  }

  file { "${home}/.zprofile":
    source => 'puppet:///modules/people/baseboxorg/zprofile',
  }

  file { "${home}/.gitconfig":
    # This should probably be managed using the git module instead...
    source => 'puppet:///modules/people/baseboxorg/gitconfig',
  }

  file { "${home}/.profile":
    source => 'puppet:///modules/people/baseboxorg/profile',
  }

  file { "${home}/.shellpaths":
    source => 'puppet:///modules/people/baseboxorg/shellpaths',
  }

  file { "${home}/.shellaliases":
    source => 'puppet:///modules/people/baseboxorg/shellaliases',
  }

  file { "${home}/.shellvars":
    source => 'puppet:///modules/people/baseboxorg/shellvars',
  }

}
