-- Get files in a path
-- Store files in a table { path, filename )
-- Get method names of [Tests] 
-- Store them in a table { path, namespace, filename, method name }

local uv = require("luv")

local M = {}
local vim = vim

local test_path = '~/Repositories/Sonitm/Net/SocialLibrary/Tests/FriendsTests'

test_path = test_path:gsub("^~(/?)", uv.os_homedir().."%1")

-- Check if is a valid dir
-- returns is_valid
local function is_directory(type)
   return type == "directory"
end

local function is_test_directory(name)
   name = string.lower(name)
   return string.match(name, 'tests')
end

local function filename_match(name, str)
   return string.match(name, str)
end

local function is_valid_file(name)
   local is_valid

   file_extension = name:match("^.+(%..+)$")
   is_valid = file_extension == ".cs"

   if vim.g.testexplorer_filename_match_tests then
      is_valid = filename_match(name, "Test")
   end

   return is_valid
end

local files = {}

local function get_files_in_directory(path)
   -- Traverse the directory
   local h = uv.fs_scandir(path)

   while true do
      local name, type = uv.fs_scandir_next(h)

      if not name then
         break
      end

      -- When type is a folder, jump into it
      if is_directory(type) and is_test_directory(name) then
         -- Fix: Path separator needs to be a backslash on Windows 
         local temp_path = path .. "/" .. name
         get_files_in_directory(temp_path)
      end

      if is_valid_file(name) then
         print(name)
         table.insert(files, name)
      end
   end
end

-- Func for testing the behavior from nvim
function M.test()
   get_files_in_directory(test_path)
end

return M
