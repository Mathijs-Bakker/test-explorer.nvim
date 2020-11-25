local vim = vim
local api = vim.api

local M = {}

local function omnisharp_sln()
   if vim.b.OmniSharp_host then
      -- Lua throws an error on vim.b.OmniSharp_host.sln_or_dir
      -- Did not test it when OmniSharp is loaded and server can provide host's path to .sln
      local sln = vim.b.OmniSharp_host.sln_or_dir
      return string.match(sln, ".+/")
   end

   local sln = '~/Repositories/Sonitm/Net/SocialLibrary/SocialLibrary.sln'
   print(sln)

   return sln
end

function M.get()
   return omnisharp_sln()
end

return M
