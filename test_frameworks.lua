local testingframeworks_data = {}

local test_framework = { "name", "namespace", "classAttribute", "methodAttribute", "csproj" }

local nunit = test_framework
nunit.name = 'Nunit'
nunit.namespace = 'using Nunit.Framework'
nunit.classAttribute = '[TestFixture]'
nunit.methodAttribute = '[Test]'
nunit.csproj = 'Include="nunit"'

local mstest = test_framework
mstest.name = 'MSTest'
mstest.namespace = 'using Microsoft.VisualStudio.TestTools.UnitTesting'
mstest.classAttribute = nil
mstest.methodAttribute = '[TestMethod]'
mstest.csproj = 'Include="MSTest.TestFramework'

local xunit = test_framework
xunit.name = 'XUnit'
xunit.namespace = 'using Xunit'
xunit.classAttribute = nil
xunit.methodAttribute = '[Fact]' -- Fix: Also has a [Theory] attribute
xunit.csproj = 'Include="xunit"'

table.insert(testingframeworks_data, nunit)
table.insert(testingframeworks_data, mstest)
table.insert(testingframeworks_data, xunit)

return testingframeworks_data

local test_config = {}

local vim = vim

function test_config.test_framework()
   

end

return test_config

