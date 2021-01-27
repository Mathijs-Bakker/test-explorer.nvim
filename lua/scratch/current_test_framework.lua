local M = {}

local solution = require('solution').get()
local path = require('path')
local extract_project = require('test-explorer/extract_project')

-- local framework_data = require("test_framework_data")

local function get()
   solution = path.make_absolute(solution)
   local sln_file = assert(io.open(solution, "r"))

   while true do
      local test_projects = {}
      local line = sln_file:read()

      if line == nil then break end
      if string.match(line, "Global") then break end

      if string.match(string.lower(line), "tests?") then
         extract_project.from(line)
      --    local candidate_test_project = line
         -- local candidate_test_project = string.match(line, '=.*csproj')
         --if string.match(candidate_test_project, '.csproj') then
         --   print("Candidate project: " .. candidate_test_project)

         --   -- Project("{FAE04EC0}") = "ExampleTests", "tests\ExampleTests\ExampleTests.csproj", "{07FC1353}"
        --   local test_csproj_path = string.match(candidate_test_project, '"%g*csproj' )
         --   -- "tests\ExampleTests\ExampleTests.csproj
         --   print("csproj path: " .. test_csproj_path)

         --   local namespace = string.match(test_csproj_path, '^(.-)%.([^%.\\/]*)$')
         --   -- local namespace = string.match(test_csproj_path, '%p%g*csproj')
         --   print("Namespace: " .. namespace)

         --   local test_dir_path = string.match(test_csproj_path, '')
         --   --TODO: OS dependent paths
         --   -- if os == unix then
         --   --    test_dir_path = test_:gsub("\\", "/")
         --   -- end
         --   print("test dir: " .. test_dir_path)

         --   -- local test_dir_path = string.match(candidate_test_project, ', ".*csproj' )
         --   -- Path looks like:
         --   -- "test\DeletemeTest\DeletemeTest.csproj"
         --   -- needs to be a full path

         --   table.insert(test_projects, line)
         --end
      end
   end
   sln_file:close()

   return test_projects
end

get()

function M.test()
  get() 
end

return M
