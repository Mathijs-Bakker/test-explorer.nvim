local sln = require("solution")
local win = require("test_window")
local cmd = require("dotnet_command")

local api = vim.api

local function open_test_window()

  if sln.omnisharp_sln ~= nil then
    local str = tostring(win.open()) .. tostring(cmd.test())
    api.nvim_command(str)
  end

end

local function run_tests()
   open_test_window()
end

return {
   run_tests = run_tests,
}
