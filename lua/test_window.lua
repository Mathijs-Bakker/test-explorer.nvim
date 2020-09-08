--[ Returns a string like: 'topleft vnew +term' ] --

local vim = vim

local M = {}

local function position()
  local show_results_leftside = vim.g.dottestchili_show_results_leftside

  local pos

  if show_results_leftside == 1 then
    pos = "topleft"
  else
    pos = "botright"
  end

  return pos
end

function M.open()
  local str
  str = tostring(position())
  str = str .. " vnew"

  return str
end

return M
