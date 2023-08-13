local deep_extend = require("user.utilities.table").deep_extend

return function(mappings)
  return deep_extend(mappings, require("user.mappings.buffers")(mappings))
end
