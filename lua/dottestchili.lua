local api = vim.api

local function open_test_window()

   local show_results_leftside = vim.g.dottestchili_show_results_leftside

   print("Running dotnet test...")

   print(vim.g.dottestchili_show_results_leftside)
   print(show_results_leftside)

-- somehow vim.g.dottestchili_show_results_leftside is nil
-- when above is resolved then:
--
-- check for a sln
-- you can get it from OmniSharp
-- 
-- echo OmniSharp#GetHost().sln_or_dir
-- Or just echo b:OmniSharp_host.sln_or_dir
--
-- if that doesnt wprk use fzzy find to find the sln
-- but as I only use OmniSharp just leave this for now
--
   if show_results_leftside then
      api.nvim_command('topleft vnew +term\\ dotmet\\ test')
   else
      api.nvim_command('botright vnew +term\\ dotnet\\ test')
   end
end

local function run_tests()
   open_test_window()
end

return {
   run_tests = run_tests,
}
