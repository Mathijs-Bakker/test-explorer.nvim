local uv = require("luv")

local path = {}

path.separator = package.config:sub(1, 1)

path.make_absolute = function(relative_path)
   local filepath = relative_path:gsub("^~(/?)", uv.os_homedir().."%1")
   return filepath
end
return path
