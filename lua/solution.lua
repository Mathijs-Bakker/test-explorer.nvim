local vim = vim
local api = vim.api

local M = {}

function M.omnisharp_sln()
   local sln = vim.b.OmniSharp_host.sln_or_dir

   if sln == nil then
      print("No solution file.")
   else
      sln = string.match(sln, ".+/")
   end

   return sln
end

return M
