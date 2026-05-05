-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local nix_parsers = "/etc/profiles/per-user/qoqoqo2/lib/nvim/parser"
if vim.loop.fs_stat(nix_parsers) then
  vim.opt.runtimepath:append(nix_parsers)
end
