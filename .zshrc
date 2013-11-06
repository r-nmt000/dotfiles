

#read setting for antigen
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
				source ~/.zsh/.zshrc.antigen
fi

#read setting for rbenv
eval "$(rbenv init - zsh)"

#Customize to your needs...

HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
setopt hist_ignore_dups               # 重複するリストを無視
setopt share_history                  # 履歴を共有
function history-all { history -E 1 } # 全履歴の一覧を出力する
#C-pとC-nを履歴検索に割り当て
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
#zshの補完機能
autoload -U compinit
compinit

#zshの言語設定
export LANG=ja_JP.UTF-8
#cd入力しないでcd
setopt auto_cd
#cdの履歴保存
setopt auto_pushd
#コマンドの訂正
setopt correct
#リストをつめて表示
setopt list_packed
# backspaseが入力できない問題
# terminfoがうまく設定されないのが原因らしい
#[[ $TERM = "eterm-color" ]] && TERM=xterm-256color
# emacsでmulti-termした時先頭に\342\236\234みたいのが出るのの対応
#[[ $EMACS = t ]] && unsetopt zle
# terminalのタイトル設定
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

PATH=$PATH:$HOME/rvm/bin # Add RVM to PATH for scripting
