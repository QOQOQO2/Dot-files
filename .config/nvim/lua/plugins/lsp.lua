return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { mason = false },
        nil_ls = { mason = false },
        jsonls = { mason = false },
        texlab = { mason = false },
        lua_ls = { mason = false },
      },
    },
  },
}
