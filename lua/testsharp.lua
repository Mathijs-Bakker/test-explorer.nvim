local api = vim.api

local function open_test_window()
   api.nvim_command("vnew")
end

local function run_tests()
   open_test_window()
end

return {
   run_tests = run_tests,
}

