export ZSH="$HOME/.oh-my-zsh"
export PATH="/home/pedro/.local/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
#Change escape key on zsh vim mode to jk
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZSH_THEME="robbyrussell"

plugins=(
    git
    dnf
    zsh-syntax-highlighting
    zsh-autosuggestions
    asdf
    zsh-vi-mode
)

#STARTUPS SCRIPTS
source $ZSH/oh-my-zsh.sh

#TMUX alias 
alias tvim='tmux new-session -t teste \; splitw -v -p 40 \; selectp -t 0  \; send-keys nvim\ $PWD Enter\; resize-pane -Z \;'
alias tm=tmux
#Misc Alias
alias goto='DIR=$(zoxide query -l | fzf --reverse --print0) ; cd $DIR'

#Terraform alias
alias t='terraform'
alias tinit='terraform init'
alias tplan='terraform plan'
alias tapply='terraform apply'

#Terragrunt alias
alias tr='terragrunt'
alias trplan='terragrunt plan'
alias trapply='terragrunt apply'

#Kubectx Alias
alias kunset='kubectx --unset'

#zoxide

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

eval "$(tmuxifier init -)"

zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')


#export GOPATH=/home/pedro/workspace/go
