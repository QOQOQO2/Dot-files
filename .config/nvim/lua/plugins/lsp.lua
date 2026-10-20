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
        clangd = { mason = false },
        arduino_language_server = {
          mason = false,
          cmd = {
            "arduino-language-server",
            "-cli-config",
            vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn",
            "arduino:avr:uno",
            "-cli",
            "arduino-cli",
            "-clangd",
            "clangd",
          },
        },
      },
    },
  },
}
