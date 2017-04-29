# Dotfiles

## Mac 

### Bash/Git

    cp bash_profile $HOME/.bash_profile
    mkdir $HOME/git
    git clone git@github.com:magicmonty/bash-git-prompt.git $HOME/git/bash-git-prompt

### SourceCodePro Font

    cd ~/git
    git clone adobe-fonts/source-code-pro.git

### Solarized

    cd ~/git
    git clone git@github.com:altercation/solarized.git


### Homebrew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Python

    brew install python pyenv-virtualenv pyenv-virtualenvwrapper
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv virtualenvwrapper
    cp virtualenvs/postactivate $HOME/.virtualenvs/

### Node.JS

    git clone https://github.com/creationix/nvm.git ~/.nvm

### Ruby

Install [RVM](https://rvm.io/rvm/install)

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    echo progress-bar >> ~/.curlrc
    curl -sSL https://get.rvm.io | bash -s stable --ruby

### Apps

  * [GPGTools](https://gpgtools.org/)
  * [iTerm2](https://www.iterm2.com/)
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
  * OmniGraffle
  * Keybase
  * Sync
  * Dropbox
  * Bartender 2
  * AndroidFile
  * Flycut
  * Tuck + Sizeup
  * JoinMe, GotoMeeting, BlueJeans, Zoom.io
  * XCode, VirtualBox, ...

### Docker

    brew cask install docker
    open /Applications/Docker.app

### Kubernetes & Helm

    brew install kubernetes-cli
    brew install kubernetes-helm

#### Minikube

https://github.com/kubernetes/minikube/releases

    curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

    # Install the xhyve driver required for minikube to use xhyve/HyperKit
    brew install --without-docker-machine --without-qcow2 docker-machine-driver-xhyve
    # Set permissions on the driver so that it can create xkyve/HyperKit VMs
    sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    # Configure minikube to use xhyve/HyperKit
    minikube config set vm-driver xhyve

### Powerline

    pip install powerline-status
    cd ~/git
    git clone https://github.com/powerline/fonts

https://powerline.readthedocs.io/en/master/installation/osx.html#fonts-installation


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
