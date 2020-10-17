-- Get files in a path
-- Store files in a table { path, filename )
-- Get method names of [Tests] 
-- Store them in a table { path, namespace, filename, method name }

local uv = require("luv")

local M = {}
local vim = vim
local version = uv.version()

local test_path = '~/Repositories/Sonitm/Net/SocialLibrary/Tests/FriendsTests'

test_path = test_path:gsub("^~(/?)", uv.os_homedir().."%1")

-- Check if is a valid dir
-- returns is_valid
local function is_dir(type)
	if type == "directory" then
		return true
	else
		return false
	end	
end

local function filename_match(name, str)
	if string.match(name, str) then
		return true
	else
		return false
	end
end
-- Check if is a valid file
-- True: has .cs extension or optional contains 'Test' in filename
-- Else return False
local function is_valid_file(name)
	local is_valid

	is_valid = filename_match(name, ".cs")

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
		if is_dir(type) then
			-- Fix: Path separator needs to be a backslash on Windows 
			local temp_path = path .. "/" .. name
			get_files_in_directory(temp_path)
		end
		
		is_valid_file(name)

		print(name)
		table.insert(files, name)
	end
end

-- Func for testing the behavior from nvim
function M.test()
	print("Version: " .. version)
	get_files_in_directory(test_path)
end

return M
