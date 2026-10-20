-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable arrow keys in normal mod
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>a", function()
  vim.g.cmp_disabled = not vim.g.cmp_disabled

  local status, blink = pcall(require, "blink.cmp")
  if status then
    if vim.g.cmp_disabled then
      blink.hide()
    end
  end

  local msg = vim.g.cmp_disabled and "Autocompletion disabled" or "Autocompletion enabled"
  vim.notify(msg, vim.log.levels.INFO)
end, { desc = "Toggle autocompletion" })
