#!/usr/bin/env bash

set -euo pipefail

# Exits 0 on a work computer and 1 otherwise.

[[ $(hostname -s) == BL* ]]
