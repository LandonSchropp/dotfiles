#!/usr/bin/env ruby

# Installs and sets up Git.

`brew install git`
`git config --global credential.helper osxkeychain`
`git config --global user.name "Landon Schropp"`
`git config --global user.email schroppl@gmail.com`
`git config --global alias.co checkout`
`git config --global alias.c commit`
`git config --global alias.b branch`
`git config --global alias.m merge`
`git config --global alias.s status`
`git config --global core.editor "subl -n -w"`
`git config --global push.default simple`