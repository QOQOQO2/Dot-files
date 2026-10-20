-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AsyncConformFormat", { clear = true }),
  callback = function(args)
    if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
      return
    end
    require("conform").format({
      bufnr = args.buf,
      async = true,
      lsp_fallback = true,
    })
  end,
})
