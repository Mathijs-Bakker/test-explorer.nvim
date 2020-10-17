-- Get files in a path
-- Store files in a table { path, filename )
-- Get method names of [Tests] 
-- Store them in a table { path, namespace, filename, method name }

local M = {}
local uv = require("luv")

local version = uv.version()

local path = '~/Repositories/Sonitm/Net/SocialLibrary/Tests/FriendsTests'

path = path:gsub("^~(/?)", uv.os_homedir().."%1")

-- Check if is a valid dir
-- returns bool
local function is_dir(type)
	if type == "directory" then
		print("IsDir == true")
	else
		print("IsDir == false")
	end	
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
