local vim = vim
local api = vim.api

local M = {}

local function omnisharp_sln()
   local sln = vim.b.OmniSharp_host.sln_or_dir

   if sln == nil then
      echom("Cannot load a solution file. No omnisharp server running to provide one.")
      echom("lua/solution.lua: Providing a .sln from Sonitm project for testing purposes...")
      sln = '~/Repositories/Sonitm/Net/SocialLibrary/Tests/FriendsTests'
   else
      sln = string.match(sln, ".+/")
   end

   return sln
end

function Get()
   omnisharp_sln()
end

return M
