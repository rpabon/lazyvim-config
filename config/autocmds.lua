-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function auto_save()
  -- Check if the file is writable and has unsaved changes
  if vim.fn.filewritable(vim.fn.expand("%")) == 1 and vim.bo.modified then
    vim.cmd("silent! write")
    vim.notify("Changes on " .. vim.fn.expand("%:t") .. " saved", vim.log.levels.INFO)
  end
end

-- Autocmd to save the file when focus is lost
vim.api.nvim_create_autocmd("FocusLost", {
  callback = auto_save,
})

-- Autocmd to save the file when buffer changes
vim.api.nvim_create_autocmd("BufLeave", {
  callback = auto_save,
})

-- Autocmd to enable the blame line when a buffer is entered
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.cmd("EnableBlameLine")
  end,
})
