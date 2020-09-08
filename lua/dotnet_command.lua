local sln = require("solution")

local M = {}

function M.test()

  local str = "+term\\ dotnet\\ test\\ "
  str = str .. tostring(sln.omnisharp_sln())

  return str
end

return M
