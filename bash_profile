dbg=false
$dbg && echo .bash_profile

OS=$(uname -s)
printf "$OS: "


# ---------------------------------------
# Homebrew
# ---------------------------------------
case $OS in
  ( Darwin )
    #$dbg && echo "HOMEBREW PATH"
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
    printf "| "

    # http://davidalger.com/development/bash-completion-on-os-x-with-brew/
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    ;;
esac


# ---------------------------------------
# GPG
# ---------------------------------------
case $OS in
  ( Darwin )
    # http://www.weinschenker.name/2013-10-08/use-gpgtools-for-ssh-logins-on-mac-os-x/
    export PATH="/usr/local/MacGPG2/bin:$PATH"
    export GPG_TTY=$(tty)
    GPG_AGENT_FILE="${HOME}/.gnupg/gpg-agent-info"
    if [ -f "${GPG_AGENT_FILE}" ] ; then
      printf "GPG | "
      source "${GPG_AGENT_FILE}"
      if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
        export GPG_AGENT_INFO
        if ${GPG_WITH_SSH:-false} ; then 
          export SSH_AUTH_SOCK
          export SSH_AGENT_PID
        fi
        #PROMPT_COMMAND+="source ${GPG_AGENT_FILE}; "
      fi
    fi
    ;;
esac


# ---------------------------------------
# Perlbrew - http://perlbrew.pl
# ---------------------------------------
case $OS in
  ( Darwin )
    #$dbg && echo "PERLBREW"
    #source ~/perl5/perlbrew/etc/bashrc
    true
    ;;
esac


# ---------------------------------------
# Python virtualenv
# ---------------------------------------
case $OS in
  ( Darwin )
    # ~~pip install virtualenv virtualenvwrapper~~
    #source /usr/local/bin/pyenv-virtualenvwrapper
    # brew install pyenv-virtualenv pyenv-virtualenvwrapper
    # https://github.com/yyuu/pyenv-virtualenv#installing-with-homebrew-for-os-x-users
    # https://github.com/yyuu/pyenv-virtualenvwrapper#usage
    printf "Python virtualenv | "
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv virtualenvwrapper
    alias deact='source deactivate'
    ;;
esac

# .venv file support - https://justin.abrah.ms/dotfiles/zsh.html#sec-2-7
function venv_prompt()
{
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e .venv && workon `cat .venv`
    fi
}

if ! [[ $PROMPT_COMMAND =~ venv_prompt ]] ; then
  PROMPT_COMMAND+="venv_prompt; "
fi


# ---------------------------------------
# Powerline 
# ---------------------------------------
# https://powerline.readthedocs.org/en/latest/installation.html
#/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#/usr/local/bin/powerline-daemon -q


# ---------------------------------------
# Node Version Manager
# ---------------------------------------
#  git clone https://github.com/creationix/nvm.git ~/.nvm
# NVM
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
    printf "Node Version Manager | "
    source "$NVM_HOME/nvm.sh"
    case $OS in
      ( Darwin )
        source $(brew --prefix nvm)/nvm.sh
        ;;
    esac
fi

# NVM TAB COMPLETION
if [[ -f "$NVM_HOME/bash_completion" ]]; then
    source "$NVM_HOME/bash_completion"
fi

# NPM TAB COMPLETION
#if npm -v >/dev/null 2>&1; then
#    . <(npm completion)
#fi


# ---------------------------------------
# Bash Git Prompt
# ---------------------------------------
# https://github.com/magicmonty/bash-git-prompt
#  brew install bash-git-prompt
printf "Bash-git-prompt | "
GIT_PROMPT_THEME=Default
case $OS in
  ( Darwin )
    if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
      source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
    fi
    ;;
  ( Linux )
    if [ -f $HOME/git/bash-git-prompt/gitprompt.sh ] ; then
      source $HOME/git/bash-git-prompt/gitprompt.sh
    fi
    ;;
esac


# ---------------------------------------
# Docker
# ---------------------------------------
#printf " Docker | "
#eval $(docker-machine env default)
#alias dm='/usr/local/bin/docker-machine'


# ---------------------------------------
# Google Cloud SDK
# ---------------------------------------
printf "Google Cloud SDK | "
case $OS in
  ( Darwin )
    if [ -f /opt/google-cloud-sdk/path.bash.inc ] ; then
      source /opt/google-cloud-sdk/path.bash.inc
    fi
    if [ -f /opt/google-cloud-sdk/completion.bash.inc ] ; then
      source /opt/google-cloud-sdk/completion.bash.inc
    fi
    ;;
  ( Linux )
    echo "TODO "
    ;;
esac


# ---------------------------------------
# AWS - boto
# ---------------------------------------
printf "AWS/boto | "
export AWS_DEFAULT_REGION=us-east-1

# AWS-CLI tab-completion
if [ -f /usr/local/bin/aws_completer ] ; then
  complete -C '/usr/local/bin/aws_completer' aws
fi


# ---------------------------------------
# Ansible
# ---------------------------------------
#printf "Ansible source | "
#export ANSIBLE_HOME=$HOME/git/ansible
#source $ANSIBLE_HOME/hacking/env-setup -q &>$TMPDIR/ansible-env-setup.out
#ansible-playbook --version
#export ec2_inv=$ANSIBLE_HOME/plugins/inventory/ec2.py


# ---------------------------------------
# iTerm2 shell integration
# ---------------------------------------
case $OS in
  ( Darwin )
    test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
    ;;
esac


# ---------------------------------------
# Ruby Virtual
# ---------------------------------------
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  printf "Ruby RVM | "
  source "$HOME/.rvm/scripts/rvm"
fi 
#. $HOME/.rvm/bin/rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# ---------------------------------------
# PATH Updates
# ---------------------------------------
if [ -d $HOME/bin ] ; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d $HOME/SpiderOak\ Hive/bin ] ; then
  export PATH=$HOME/SpiderOak\ Hive/bin:$PATH
fi

set -o vi

