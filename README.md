# Testsharp

Testsharp should:
* Run c# tests from nvim. 
* Tests should open in either:
  * Tmux pane
  * Nvim split
* Support ``$ dotnet test``, ``:OmniSharpRunTest`` and ``:OmnisSharpRunTestsInFile``
* Manual command: Start test run with a key
* Auto command: Run tests on save buffer event.

Nice to have:
* Toggle tests 
* Test sessions (running particular tests from particular files.)
* Show active tests in gutter
* Show failing tests in gutter
