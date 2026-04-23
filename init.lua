vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
  { import = 'colorschemes' },
})

-- == PYTHON STUFF ==
-- Right now this is only for render-markdown.nvim but that might change in the future.
-- Dependencies so far are the following:
--    * pynvim (essential for all Nvim plugins that use Python)
--    * pylatexenc (for render-markdown's latex rendering)

vim.env.PYTHONUTF8 = 1
vim.env.PYTHONIOENCODING = "utf8"

-- Dynamically find Python in the system PATH
local python_path = vim.fn.exepath('python3')
if python_path == '' then
    python_path = vim.fn.exepath('python')
end

if python_path ~= '' then
    vim.g.python3_host_prog = python_path
end

require('telekasten').setup({
    home = vim.fn.expand("C:/users/jians/desktop/SecondBrain"), 

    command_palette_theme = "dropdown", 
    show_tags_theme = "dropdown",
})

require('config.options')
require('config.mappings')

