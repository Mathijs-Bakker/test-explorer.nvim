local path = require("path")
local solution = require("solution")

local sln_project_block_converter = {}

local strip_quotes = function(str)
   str = str:gsub('"', '')
   return str
end

local get_path_from_project_block = function(line)
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

local create_absolute_path = function(project_rel_from_sln_path)

   local sln = solution:get()
   local sln_path = remove_filename_from_path(sln)

   local os = package.config:sub(1, 1) == '\\' and 'win' or 'unix'

   if os =='unix' then
      project_rel_from_sln_path = project_rel_from_sln_path:gsub("\\", "/")
   end

   return sln_path .. project_rel_from_sln_path 
end

sln_project_block_converter.get = function(line)
   local project_block_path = get_path_from_project_block(line)
   project_path = remove_filename_from_path(project_block_path)
   project_path = create_absolute_path(project_path)
   project_path = path.make_absolute(project_path)

   local filename = get_filename_from_path(project_block_path)
   local project_name, project_type = get_project_properties(filename)

   return project_name, project_type, project_path
end

return sln_project_block_converter
