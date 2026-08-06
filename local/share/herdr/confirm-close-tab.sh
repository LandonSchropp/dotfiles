#!/usr/bin/env bash

set -euo pipefail

# Asks for confirmation before closing the current Herdr tab. Herdr's own close_tab action never
# confirms, so cmd+w is bound to this instead.
#
# TODO: Drop this and bind cmd+w back to close_tab once Herdr confirms tab closes itself.
# https://github.com/herdrdev/herdr/issues/1750

if [[ -z "${HERDR_TAB_ID:-}" ]]; then
  echo "Error: HERDR_TAB_ID is not set." >&2
  exit 1
fi

gum confirm "Close this tab?" || exit 0

herdr tab close "$HERDR_TAB_ID"
