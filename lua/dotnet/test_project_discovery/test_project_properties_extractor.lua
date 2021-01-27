M = {}

M.get_project_path = function(project_block)
   local path = string.match(project_block, '"%g*sproj"')
   return path:gsub('"', '')
end

M.get_path_without_filename = function(path)
   local relative_path_to_project_dir = path:match('^.-[\\/].*[\\/]')
   return relative_path_to_project_dir
end

M.get_filename_from_path = function(path)
   local filename = path:match('[^\\/]*$')
   return filename
end

M.get_project_properties = function(filename)
   local name, extension = filename:match('^(.-)%.([^%.\\/]*)$')
   return name, extension
end

M.create_absolute_path = function(project_rel_from_sln_path)

   local sln = solution:get()
   local sln_path = remove_filename_from_path(sln)

   local os = package.config:sub(1, 1) == '\\' and 'win' or 'unix'

   if os =='unix' then
      project_rel_from_sln_path = project_rel_from_sln_path:gsub("\\", "/")
   end

   return sln_path .. project_rel_from_sln_path
end

return M
