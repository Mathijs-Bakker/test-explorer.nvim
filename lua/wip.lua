-- Takes a line from solution file and returns test project properties: project's absolute path, name and type (scproj/fsproj)
-- 'Project("{FAE04EC0}") = "ExampleTests", "tests\\ExampleTests\\ExampleTests.csproj", "{07FC1353}"'

-- TODO: Returned path needs to be absolute and platform-dependent 

local path = require("path")
local solution = require("solution")

local sln_project_block_converter = {}

local strip_quotes = function(str)
   str = str:gsub('"', '')
   return str
end

local get_candidate_project_path = function(line)
   local quotes_dirty_project_path = string.match(line, '"%g*sproj"')
   local path = strip_quotes(quotes_dirty_project_path)
   return path
end

local remove_filename_from_path = function(path)
   local relative_path_to_project_dir = path:match('^.-[\\/].*[\\/]')
   return relative_path_to_project_dir
end

local get_filename_from_path = function(path)
   local filename = path:match('[^\\/]*$')
   return filename
end

local get_project_properties = function(filename)
   local name, extension = filename:match('^(.-)%.([^%.\\/]*)$')
   return name, extension
end

sln_project_block_converter.get = function(line)
   local path = get_candidate_project_path(line)
   local path_from_sln = remove_filename_from_path(path)

   local filename = get_filename_from_path(path)
   local project_name, project_type = get_project_properties(filename)
   print("rel_path: " .. path_from_sln .. "\nproject_name: " .. project_name .. "\nproject_type: " .. project_type)

   local uv = require("luv")

   local filepath = path_from_sln:gsub("^~(/?)", uv.os_homedir().."%1")
   -- local abs_path = path:make_absolute(path_from_sln)
   print("absolute " .. filepath)

   path.solution = function()
      local sln = solution:get()
      print("sln" .. sln)
   end
end

local sln = solution:get()
local sln_path = remove_filename_from_path(sln)

print("sln: " .. sln)
print("sln_path: " .. sln_path)

local os = package.config:sub(1, 1) == '\\' and 'win' or 'unix'
local path_from_sln = "my\\path\\" 
if os =='unix' then
   print("nox")
  path = path:gsub("\\", "/")
end

local proj_path = sln_path .. path
print("proj_path: " .. proj_path)

return sln_project_block_converter
-- lua require'wip'.get(Project("{FAE04EC0}") = "ExampleTests", "tests\\ExampleTests\\ExampleTests.csproj", "{07FC1353}"')
