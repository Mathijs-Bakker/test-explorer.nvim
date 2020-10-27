-- Takes a line from solution file and returns test project properties: project's absolute path, name and type (scproj/fsproj)
-- 'Project("{FAE04EC0}") = "ExampleTests", "tests\\ExampleTests\\ExampleTests.csproj", "{07FC1353}"'

-- TODO: Returned path needs to be absolute and platform-dependent 
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
   local relative_path = remove_filename_from_path(path)

   local filename = get_filename_from_path(path)
   local project_name, project_type = get_project_properties(filename)
   print("rel_path: " .. relative_path .. "\nproject_name: " .. project_name .. "\nproject_type: " .. project_type)
end

return sln_project_block_converter
