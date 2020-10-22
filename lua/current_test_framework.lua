local current_test_framework = {}

local solution_path = require("solution").get()

local framework_data = require("test_framework_data")


function get()
   local f_sln = assert(io.open(solution_path, "r"))

   while true do
      local line = io.read("*line")
      if line == nil then break end
      if string.match(line, "Global") then break end
      
      if string.match(string.lower(line), "tests") then
         local candidate_project_path = string.match(line, '".*"')
         if string.match(candidate_project_path, '.csproj') then
            print("Add tests directory: " ... s)
         end
      end
   end 
   f_sln:close()
end

return current_test_framework
