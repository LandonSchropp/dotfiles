local deep_extend = require("utilities.table").deep_extend

return function(mappings)
  return deep_extend(
    mappings,
    require("mappings.buffers")(mappings),
    require("mappings.comments")(mappings),
    require("mappings.files")(mappings),
    require("mappings.find")(mappings),
    require("mappings.home")(mappings),
    require("mappings.test")(mappings),
    require("mappings.text")(mappings),
    require("mappings.ui")(mappings),
    require("mappings.yank")(mappings)
  )
end
