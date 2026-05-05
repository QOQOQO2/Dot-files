return {
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "skip",
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {}
      opts.automatic_installation = false
    end,
  },
}
