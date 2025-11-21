export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# History settings
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt APPEND_HISTORY # appends history instead of overwriting
setopt HIST_IGNORE_DUPS # ignores duplicate lines in history
setopt HIST_IGNORE_ALL_DUPS # Ignores duplicate lines in history and saves only the most recent
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# Environment variables
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/devel/my-binaries
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
export EDITOR=nvim
export VISUAL=nvim
export GOOGLE_CLOUD_PROJECT="prj-c-platformtools-fn8z"

# Make less more friendly
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias lzd='lazydocker'
alias gpc='globalprotect connect -g gw.trioptima.com'
alias gpd='globalprotect disconnect'
alias gpr='globalprotect rediscover-network'
alias kerberos='kinit_kerberos'
alias kube-auth-dev="source $HOME/devel/auth/triauth-config/dev/openstack/os-login triauth-dev"
alias kube-auth-uat="source $HOME/devel/auth/triauth-config/uat/openstack/os-login triauth-uat triauth-dev"
alias kube-auth-prod="source $HOME/devel/auth/triauth-config/prod/openstack/os-login triauth-prod triauth-dev"
alias kube-vent-dev="source $HOME/devel/vent/trivent-config/dev/openstack/k8s-login"
alias kube-vent-prod="source $HOME/devel/vent/trivent-config/prod/openstack/k8s-login"


# function to fetch a Kerberos ticket
kinit_kerberos() {
    local kerberos_username="erikw@TRIOPTIMA.LOCAL"
    password=$(pass other/kerberos/"$kerberos_username")
    if [ $? -eq 0 ]; then
        echo "$password" | kinit "$kerberos_username"
        echo "Retrieved Kerberos ticket"
    else
        echo "Failed to retrieve Kerberos password."
    fi
}

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# `globstar` is native to Zsh, so the Bash `shopt` command is not needed.
# The following will make it work just like in Bash
setopt glob_subst

# Path variable for pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -v

# McFly
eval "$(mcfly init zsh)"

function zsh_cursor_shape() {
  case $KEYMAP in
    vicmd)
      # Normal (vicmd) mode: block cursor
      echo -ne '\e[2 q'
      ;;
    main|viins)
      # Insert (main or viins) mode: vertical bar cursor
      echo -ne '\e[5 q'
      ;;
  esac
}
zle -N zle-keymap-select zsh_cursor_shape
zle-line-init() {
  # Set initial cursor shape on a new line
  echo -ne '\e[5 q'
}
zle -N zle-line-init

export NVM_SYMLINK_CURRENT=true
