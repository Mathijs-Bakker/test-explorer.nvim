local line = 'Project("{FAE04EC0}") = "ExampleTests", "tests\\ExampleTests\\ExampleTests.csproj", "{07FC1353}"'
local line = 'Project("{FAE04EC0}") = "Testsproject", "tests\\foo\\bar\\anotherdir\\TestsProject\\TestsProject.fsproj", "{07FC1353}"'

local t = {}

-- local dirty_project_path_candidate = string.match(line, '"%g*sproj"')
-- print("dirty_project_path_candidate: " .. dirty_project_path_candidate)

-- local project_path_candidate = dirty_project_path_candidate:gsub('"', '')
-- print("project_path_candidate: " .. project_path_candidate)

-- local path = project_path_candidate:match('^.-[\\/].*[\\/]')
-- print("path: " .. path)

-- local filename = project_path_candidate:match('[^\\/]*$')
-- print("filename: " .. filename)

-- local project_name, project_type = filename:match('^(.-)%.([^%.\\/]*)$')
-- print("project_name: " .. project_name)
-- print("project_type: " .. project_type)

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

t.get = function(line)
   local path = get_candidate_project_path(line)
   local relative_path = remove_filename_from_path(path)

   local filename = get_filename_from_path(path)
   local project_name, project_type = get_project_properties(filename)
   print("rel_path: " .. relative_path .. "\nproject_name: " .. project_name .. "\nproject_type: " .. project_type)
end

return t

-- Takes a line from solution file and returns test project properties: project's absolute path, name and type (scproj/fsproj)


