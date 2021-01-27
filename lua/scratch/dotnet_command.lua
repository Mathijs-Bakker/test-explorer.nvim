local sln = require("solution")

local M = {}

function M.test()

  local str = "+term\\ dotnet\\ test\\ "
  str = str .. tostring(sln.omnisharp_sln())
  str = str .. "\\ --nologo"
  str = str .. "\\ --logger \"console;verbosity=detailed"
  return str
end

return M
