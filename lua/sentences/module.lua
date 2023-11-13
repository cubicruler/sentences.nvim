local api = vim.api

---@class CustomModule
local M = {}

M.highlight_sentence = function()
  -- Get the current line and cursor position
  local line = api.nvim_get_current_line()
  local col = api.nvim_win_get_cursor(0)[2]

  -- Find the start and end of the sentence
  local start_col = line:sub(1, col):find("%S[^.]*.$")
  local end_col = col + line:sub(col):find("^.-%.") - 1

  -- Get the current buffer
  local buf = api.nvim_get_current_buf()

  -- Remove old highlights
  api.nvim_buf_clear_namespace(buf, -1, 0, -1)

  -- Add new highlight
  api.nvim_buf_add_highlight(buf, -1, "Error", api.nvim_win_get_cursor(0)[1] - 1, start_col - 1, end_col)
end

return M