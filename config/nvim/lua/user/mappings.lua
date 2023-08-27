local deep_extend = require("user.utilities.table").deep_extend

return function(mappings)
  return deep_extend(
    mappings,
    require("user.mappings.buffers")(mappings),
    require("user.mappings.comments")(mappings),
    require("user.mappings.files")(mappings),
    require("user.mappings.find")(mappings),
    require("user.mappings.home")(mappings),
    require("user.mappings.text")(mappings),
    require("user.mappings.yank")(mappings),
    require("user.mappings.session")(mappings)
  )
end
