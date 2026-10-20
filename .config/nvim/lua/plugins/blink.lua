return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.enabled = function()
        if vim.g.cmp_disabled then
          return false
        end
        return vim.bo.buftype ~= "prompt"
      end

      opts.sources = opts.sources or {}
      opts.sources.default = { "lsp", "path", "buffer" }

      return opts
    end,
  },
}
