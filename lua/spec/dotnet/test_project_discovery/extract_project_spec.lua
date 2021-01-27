require 'busted.runner'()

local sut = require 'dotnet/test_project_discovery/test_project_properties_extractor'

describe("Extract and return the properties of a test project from a 'project block' (as found in a .NET solution file):\n", function()
   describe("get_project_path() :", function()
      it("Should return the path of a Csharp project", function()

         local cs_project_block = 'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "TestProject", "TestProject\\TestProject.csproj", "{0A9D5C8D-ECEB-42D3-B3CC-C71323CEE27C}"'

         local expected = 'TestProject\\TestProject.csproj'

         assert.is_equal(expected, sut.get_project_path(cs_project_block))

      end)

      it("should return the path of a Fsharp project", function()

         local fs_project_block = 'Project("{6EC3EE1D-3C4E-46DD-8F32-0CC8E7565705}") = "MathService.Tests", "MathService.Tests\\MathService.Tests.fsproj", "{30EE6D40-36ED-438D-B92B-8574F9C132E6}"'

         local expected = 'MathService.Tests\\MathService.Tests.fsproj'

         assert.is_equal(expected, sut.get_project_path(fs_project_block))

      end)
   end)

   describe("get_path_without_filename(path) :", function ()
      it("Should return the path without the filename", function()

         local path = 'path\\to\\testproject.csproj'

         local expected = 'path\\to\\'
         assert.is_equal(expected, sut.get_path_without_filename(path))
      end)
   end)

      describe("get_filename_from_path(path) :", function()
      it("Should return the filename with extension", function()
         local path = 'a\\b\\testproject.csproj'
         local expected = 'testproject.csproj'

         assert.is_equal(expected, sut.get_filename_from_path(path))
      end)
   end)

   describe("get_project_properties(filename) :", function()
      local filename = 'a.ext'

      it("Should return 2 arguments", function()
         assert.returned_arguments(2, sut.get_project_properties(filename))
      end)

      local name, extension = sut.get_project_properties(filename)

      it("Should return the file name", function()
         assert.is_equal(name, 'a')
      end)

      it("Should return the file extension", function()
         assert.is_equal(extension, 'ext')
      end)
   end)


   local solution = require 'dotnet/test_project_discovery/solution'

   describe("create_absolute_path(relative_path)", function()
      it("should return an absolute path", function()
         local sln_mock = mock(solution)
      end)
   end)
end)
