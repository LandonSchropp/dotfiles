#!/usr/bin/env ruby

# Install GCC (Xcode ships with LLVM-GCC, which can cause problems when compiling Ruby).
#
# Prerequisits:
# * Xcode Command Line Tools

`brew tap homebrew/dupes`
`brew install apple-gcc42`