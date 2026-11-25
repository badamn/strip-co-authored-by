#!/bin/sh
# Usage:
#   ./install.sh            -> install into current repo (.git/hooks)
#   ./install.sh --global   -> install for all repos via core.hooksPath
set -e
SRC="$(cd "$(dirname "$0")" && pwd)/hooks/commit-msg"
if [ "$1" = "--global" ]; then
  DIR="$HOME/.git-hooks"
  mkdir -p "$DIR"
  cp "$SRC" "$DIR/commit-msg"; chmod +x "$DIR/commit-msg"
  git config --global core.hooksPath "$DIR"
  echo "Installed globally: $DIR (core.hooksPath)"
else
  DIR="$(git rev-parse --git-path hooks)"
  mkdir -p "$DIR"
  cp "$SRC" "$DIR/commit-msg"; chmod +x "$DIR/commit-msg"
  echo "Installed into $DIR"
fi
