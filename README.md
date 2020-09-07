# [wip] - The Dottest Chili

### Disclaimer
These are my first baby steps in creating a NeoVim plugin with LUA.
I am quite a n00b with LUA and lacking best practices concerning NeoVim plugins.
So bear with me ;)

## The problem this plugin should solve
Run C# tests in your project. And receive the test results in a split.

```
The Dottest Chili should:
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
```
