local api = vim.api
local buf, win

local function open_Window()
    buf = api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    -- get dimensions
    local width = api.nvim_buf_get_option("columns")
    local height = api.nvim_buf_get_option("lines")

    -- calculate our floating window style
    local win_height = math.ceil(height * 0.8 -4)
    local win_width = math.ceil(width * 0.8)

    -- and it's starting position
    local row = math.ceil((height - win_height) / 2- 1)
    local col = math.ceil((width - win_width) / 2)

    -- set some options
    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col
    }

    -- and finally create ith with buffer attached
    win = api.nvim_open_win(buf, true, opts)
end

