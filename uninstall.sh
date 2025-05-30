#!/bin/sh
# cspell:disable-next-line
# uninstall by (github: @bernardofire)
# Remove line from bashrc and zshrc if present.

OS=$(uname -s | awk '{print tolower($0)}')

sed="sed -i"
if [[ "$OS" == "darwin" ]]; then
  sed="sed -i ''"
fi

if [ -f "$HOME/.bashrc" ]; then
  $sed '/scm_breeze/d' "$HOME/.bashrc" &&
    printf "Removed SCM Breeze from '%s'\n" "$HOME/.bashrc"
fi

if [ -f "${ZDOTDIR:-$HOME}/.zshrc" ]; then
  $sed '/scm_breeze/d' "${ZDOTDIR:-$HOME}/.zshrc" &&
    printf "Removed SCM Breeze from '%s'\n" "${ZDOTDIR:-$HOME}/.zshrc"
fi
