-- Get files in a path
-- Store files in a table { path, filename )
-- Get method names of [Tests] 
-- Store them in a table { path, namespace, filename, method name }

local uv = require("luv")

local M = {}
local vim = vim
local version = uv.version()

local path = '~/Repositories/Sonitm/Net/SocialLibrary/Tests/FriendsTests'

path = path:gsub("^~(/?)", uv.os_homedir().."%1")

-- Check if is a valid dir
-- returns is_valid
local function is_dir(type)
	if type == "directory" then
		print("IsDir == true")
	else
		print("IsDir == false")
	end	
end

local function filename_match(name, str)
	if string.match(name, str) then
		print("It's a " .. str .. " file")
		return true
	else
		print("It's not a " .. str .. " file")
		return false
	end
end
-- Check if is a valid file
-- True: has .cs extension or optional contains 'Test' in filename
-- Else return False
local function is_valid_file(name)
	local is_valid

	is_valid = filename_match(name, ".cs")

	if vim.g.testexplorer_filename_match_test then
		is_valid = filename_match(name, "Test")
	end

	print(is_valid)

	return is_valid
end

local files = {}

local function get_files_in_directory()
	-- API 1, iterate file by file.
	local h = uv.fs_scandir(path)
	print(h)
	while true do
		local name, type = uv.fs_scandir_next(h)
		print(name .. " " .. type)
		is_dir(type)
		is_valid_file(name)
		if not name then
			break
		end

		table.insert(files, name)
		print(table.getn(files))
	end
end

-- Func for testing the behavior in nvim
function M.test()
	print("Version: " .. version)
	get_files_in_directory()
end

return M
