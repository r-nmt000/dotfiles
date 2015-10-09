#folkしたoh-my-zshを使うための設定
# export ANTIGEN_DEFAULT_REPO_URL="https://github.com/r-nmt000/oh-my-zsh.git"
export ANTIGEN_DEFAULT_REPO_URL="https://github.com/robbyrussell/oh-my-zsh.git"
#read settings for antigen
if [ -f $HOME/.zsh/antigen/antigen.zsh ]; then 
   source ~/.zsh/.zshrc.antigen
fi


#Customize to your needs...

HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
setopt hist_ignore_dups               # 重複するリストを無視
setopt share_history                  # 履歴を共有
setopt nonomatch                      # glob失敗時の警告をやめさせる
function history-all { history -E 1 } # 全履歴の一覧を出力する
#C-pとC-nを履歴検索に割り当て
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
#zshの補完機能
autoload -U compinit
compinit




#zshの言語設定
export LANG=ja_JP.UTF-8
#cd入力しないでcd
setopt auto_cd
#cdの履歴保存
setopt auto_pushd
#同じディレクトリは追加しない
setopt pushd_ignore_dups
#--- zsh 用の設定 ---
# . /usr/local/etc/autojump.zsh
#
# alias j="autojump"
# if [ -f `brew --prefix`/etc/autojump ]; then
#   . `brew --prefix`/etc/autojump
# fi

#コマンドの訂正
setopt correct
#リストをつめて表示
setopt list_packed
#BGの処理が終了したら即時報告
setopt notify

#Term2のタブ名を変更する
DISABLE_AUTO_TITLE="true"
function title {
  echo -ne "\033]0;"$*"\007"
  # echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
}

########################
#       pyenv          #
########################
export PYENV_ROOT="${HOME}/.pyenv"
if [ -n ${PYENV_ROOT} ]; then
  path=(${PYENV_ROOT}/bin ${PYENV_ROOT}/shims ${path}) 
fi
eval "$(pyenv init -)"

########################
#       alias          #
########################

# -I バイナリファイル無視, svn関係のファイルを無視
# -i 大文字小文字を無視, 拡張正規表現を使う
alias grep="grep --color -I -i -E"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# tmuxで日本語を使えるように
alias tmux="tmux -u"

# git関連のエイリアス
alias gs="git status"
#settings for virualenv(Python)
export WORKON_HOME=$HOME/.virtualenvs

########################
# settings for each OS #
########################

case ${OSTYPE} in
  darwin*)
    #Settings for Mac

    #read setting for rbenv
    eval "$(rbenv init - zsh)"
    PATH=$PATH:$HOME/rvm/bin # Add RVM to PATH for scripting
    #



    if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
      source /usr/local/bin/virtualenvwrapper.sh
    fi
    ;;


  linux*)
    #Settings for Linux

    if [ -f /usr/bin/virtualenvwrapper.sh ]; then
      source /usr/bin/virtualenvwrapper.sh
    fi
    ;;
esac


# 新規にzshを開いたら前回の作業ディレクトリに移動
cd `cat ~/.curdir`
