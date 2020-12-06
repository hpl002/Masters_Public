#!/bin/zsh
# runs the markdown pre-processor which then collects all referenced markdown and spits out a dereferenced version.
# Assume that you have markdown-pp installed.
# https://github.com/jreese/markdown-pp
exec markdown-pp main/outline.mdpp -o main/outline.md
