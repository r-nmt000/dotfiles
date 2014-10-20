#!/bin/bash

function fixpatch(){
  basefile=${1}
  tmp="tmp.php"
    tmp2="tmp2.php"

  cp $basefile $tmp
  if [ "${2}" = "local" ]; then
    sed "/>>>>>>>/d" $basefile > $tmp
      start_array=($(cat $tmp  | grep -n "<<<<<<<" | cut -d ':' -f 1))
      end_array=($(cat $tmp | grep -n "=======" | cut -d ':' -f 1))
      elif [ "${2}" = "remote"  ]; then
    sed "/<<<<<<</d" $basefile > $tmp
    start_array=($(cat $tmp  | grep -n "=======" | cut -d ':' -f 1))
    end_array=($(cat $tmp | grep -n ">>>>>>>" | cut -d ':' -f 1))
  fi

  cat $tmp > $tmp2

# コンフリクト箇所を省く.
  for (( i=0; i<${#start_array[@]}; i++ ))
  do
    cp $tmp2 $tmp
    num=$((${#start_array[@]} - ${i} - 1))
    sed -e "${start_array[$num]},${end_array[$num]}d" $tmp > $tmp2
  done
   
  cat $tmp2
  rm $tmp
  rm $tmp2
  return 0
}

# ブランチ名を取得
BRANCH=$(git branch --no-color | sed -n -e 's/^\* //p')
gitroot="$(git rev-parse --show-toplevel)/"

# mergeに関するファイルを取得
MERGED=${1}
LOCAL=${2}
BASE=${3}
REMOTE=${4}

# MERGEDファイルのコンフリクト箇所を除外
fixedpatch_local="fixedpatch_local.php"
fixedpatch_remote="fixedpatch_remote.php"
fixpatch ${MERGED} "local" > $fixedpatch_local
fixpatch ${MERGED} "remote" > $fixedpatch_remote

echo ${fixedpatch_local}
echo ${fixedpatch_remote}

cp ${fixedpatch_local} ${MERGED}


# vimdiffで開く
vim -f \
    -c 'set nofoldenable' \
    -c 'wincmd p'         \
    -c 'set nofoldenable' \
    -c 'wincmd p'         \
    -c 'noremap J ]c'     \
    -c 'noremap K [c'     \
    -c "set tags+=.tags;${gitroot}"  \
    -d $MERGED $fixedpatch_remote

# ゴミファイルを削除
 rm $fixedpatch_local
 rm $fixedpatch_remote
