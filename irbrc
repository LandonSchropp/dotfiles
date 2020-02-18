require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# TODO: Remove this line with IRB supports refinements by default.
# https://bugs.ruby-lang.org/issues/9580
IRB.conf[:CONTEXT_MODE] = 1
