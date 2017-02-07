# Dotfiles

## Mac 

### Bash/Git

    cp bash_profile $HOME/.bash_profile
    mkdir $HOME/git
    git clone git@github.com:magicmonty/bash-git-prompt.git $HOME/git/bash-git-prompt

### Homebrew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Python

    brew install pyenv-virtualenv pyenv-virtualenvwrapper
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv virtualenvwrapper
    cp virtualenvs/postactivate $HOME/.virtualenvs/

### Node.JS

    git clone https://github.com/creationix/nvm.git ~/.nvm

### Ruby

_todo_

### Apps

  * Slack
  * Evernote
  * Toggl
  * Atom
  * Skitch
  * VLC
  * Adobe Reader
  * Skype
  * Screen Hero
  * Chrome


## Ubuntu Linux

### Bash/Git

    cp bash_profile $HOME/.bash_profile
    mkdir $HOME/git
    git clone git@github.com:magicmonty/bash-git-prompt.git $HOME/git/bash-git-prompt

### Python

    sudo apt-get install python python-dev python-pip python-virtualenv virtualenvwrapper
    source /etc/bash_completion.d/virtualenvwrapper
    cp virtualenvs/postactivate $HOME/.virtualenvs/

### Node.JS

    git clone https://github.com/creationix/nvm.git ~/.nvm

### Ruby

_todo_

### Apps

  * Slack
  * Evernote
  * Toggl
  * Atom
  * Skitch
  * VLC
  * Adobe Reader
  * Skype
  * Screen Hero
  * Chromium

## Arch Linux

_Someday..._
