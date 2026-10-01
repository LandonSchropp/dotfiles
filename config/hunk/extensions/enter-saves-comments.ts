// HACK: Makes Enter save a comment and Shift+Enter start a new line by reaching into Hunk's
// renderer, which extensions aren't meant to touch. Delete this file once Hunk lets the comment
// editor's keys be remapped (https://github.com/modem-dev/hunk/issues/846).

import type { HunkExtensionAPI } from "hunkdiff/extension";
import { createElement } from "react";

/** The slice of an OpenTUI key event this rewrites. */
interface KeyEvent {
  name: string;
  ctrl: boolean;
  shift: boolean;
}

/** The slice of OpenTUI's renderer this reads. */
interface Renderer {
  currentFocusedEditor: object | null;
  keyInput: {
    prependListener(event: "keypress", listener: (key: KeyEvent) => void): void;
  };
}

const PROBE_PANE = "probe";
const CLOSE_EVENT = "enter-saves-comments:close";

const CLOSE_DELAY = 150;

/** Turns Enter in the comment editor into Hunk's Ctrl+S save, and Shift+Enter into a newline. */
function rewrite(renderer: Renderer, key: KeyEvent) {
  if (key.name !== "return" && key.name !== "enter") return;
  if (renderer.currentFocusedEditor?.constructor.name !== "TextareaRenderable") return;

  if (key.shift) {
    key.name = "linefeed";
    key.shift = false;
    return;
  }

  key.name = "s";
  key.ctrl = true;
}

export default function (hunk: HunkExtensionAPI) {
  let installed = false;

  // Borrow the renderer from a throwaway pane.
  hunk.registerPane({
    id: PROBE_PANE,
    title: "",
    placement: "bottom",
    height: { preferred: 1, min: 1, max: 1 },
    resizable: false,
    component: () =>
      createElement("text", {
        content: "",
        ref: (anchor: { ctx: Renderer } | null) => {
          if (!anchor || installed) return;

          installed = true;
          const renderer = anchor.ctx;
          renderer.keyInput.prependListener("keypress", (key) => rewrite(renderer, key));
          setTimeout(() => hunk.events.emit(CLOSE_EVENT, {}), CLOSE_DELAY);
        },
      }),
  });

  hunk.events.on(CLOSE_EVENT, (_payload, context) => context.panes.close(PROBE_PANE));

  hunk.on("changeset_loaded", (_event, context) => {
    if (!installed) context.panes.open(PROBE_PANE);
  });
}
