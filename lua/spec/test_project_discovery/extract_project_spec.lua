--require ('plenary.test_harnes').setup_busted()

require 'busted.runner'()

local sut = require 'test_project_discovery.test_project_reader'

describe("get_project_path(project_block):", function()
   it("should return the c# project path", function()

      local cs_project_block = 'Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "TestProject", "TestProject\\TestProject.csproj", "{0A9D5C8D-ECEB-42D3-B3CC-C71323CEE27C}"'

      local expected = 'TestProject\\TestProject.csproj'

      assert.is_equal(expected, sut.get_project_path(cs_project_block))

   end)

   it("should return the f# project path", function()

      local fs_project_block = 'Project("{6EC3EE1D-3C4E-46DD-8F32-0CC8E7565705}") = "MathService.Tests", "MathService.Tests\\MathService.Tests.fsproj", "{30EE6D40-36ED-438D-B92B-8574F9C132E6}"'

      local expected = 'MathService.Tests\\MathService.Tests.fsproj'

      assert.is_equal(expected, sut.get_project_path(fs_project_block))

   end)
end)

describe("get_path_without_filename(path)", function ()
   it("should return the path with the filename stripped", function()

      local path = 'a\\b\\TestProject.csproj'

      local expected = "a\\b\\"
      assert.is_equal(expected, sut.get_path_without_filename(path))
   end)
end)

describe("get_filename_from_path(path):", function()
   it("should return the filename from a full path", function()
      local path = 'a\\b\\c.ext'
      local expected = 'c.ext'

      assert.is_equal(expected, sut.get_filename_from_path(path))
   end)
end)

describe("get_project_properties(filename):", function()

   local filename = 'a.ext'

   it("should return 2 arguments", function()
      assert.returned_arguments(2, sut.get_project_properties(filename))
   end)

   describe("returned values,", function()

      local name, extension = sut.get_project_properties(filename)

      it("should return the file name", function()
         assert.is_equal(name, 'a')
      end)

      it("should return the file extension", function()
         assert.is_equal(extension, 'ext')
      end)
   end)
end)

local solution = require 'test_project_discovery.solution'

describe("create_absolute_path(relative_path)", function()
   it("should return an absolute path", function()
      local sln_mock = mock(solution)
   end)
end)
