-- Autocompletion (LSP, buffer words, file paths, snippets) via blink.cmp.
-- The "1.*" version pulls a prebuilt Rust fuzzy matcher, so there's nothing to compile.
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "BufReadPre", "BufNewFile", "CmdlineEnter" }, -- before LSP starts, so its capabilities are registered
    opts = {
      -- Enter accepts, Tab/S-Tab move through items and snippet placeholders,
      -- C-Space opens the menu or docs, C-e closes it.
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
      },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
  },
}
