#!/bin/sh -

if [ ! -d ~/.zplug ]; then
  curl -sL zplug.sh/installer | zsh
fi
