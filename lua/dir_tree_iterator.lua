-- Get files in a path
local M = {}
local uv = require("luv")

local version = uv.version()

local path = '~/Repositories/Sonitm/Net/SocialLibrary/Tests/FriendsTests'

path = path:gsub("^~(/?)", uv.os_homedir().."%1")

local function get_files_in_directory()
	-- API 1, iterate file by file.
	local h = uv.fs_scandir(path)
	print(h)
	while true do
		local name, type = uv.fs_scandir_next(h)
		print(name)
		if not name then
			break
		end
	end
end

function M.test()
	print("Version: " .. version)
	get_files_in_directory()
end

return M
