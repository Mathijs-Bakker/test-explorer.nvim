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

local StripQuotes = function(str)
   str = str:gsub('"', '')
   return str
end

local Get_Candidate_Project_Path = function(line)
   local dirty_project_path_candidate = string.match(line, '"%g*sproj"')
   return StripQuotes(dirty_project_path_candidate)
end

local Get_Relative_Path_To_Project_Directory = function(path)
   local relative_path = path:match('^.-[\\/].*[\\/]')
   return relative_path
end

local Get_Filename = function(path)
   local filename = project_path_candidate:match('[^\\/]*$')
   return filename
end

local Get_Project = function(filename)
   local proj_name, proj_type = filename:match('^(.-)%.([^%.\\/]*)$')
   return proj_name, proj_type
end

return t

