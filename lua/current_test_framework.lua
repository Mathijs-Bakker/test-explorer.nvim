local M = {}

local solution = require('solution').get()
local path = require('path')

-- local framework_data = require("test_framework_data")

local function get()
   local home = vim.fn.expand("~")
   -- solution = solution:gsub("^" .. home, '~', 1)
   solution = path.expand(solution)
   print("current : " .. solution)
   local f_sln = assert(io.open(solution, "r"))

   while true do
      local line = io.read("*line")
      if line == nil then break end
      if string.match(line, "Global") then break end
      
      if string.match(string.lower(line), "tests") then
         local candidate_project_path = string.match(line, '".*"')
         if string.match(candidate_project_path, '.csproj') then
            print("Add tests directory: " .. candidate_project_path)
         end
      end
   end 
   f_sln:close()
end

function M.test()
  get() 
end

return M
