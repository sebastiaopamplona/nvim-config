-- Markdown preview rendered inside the buffer via render-markdown.
-- Uses the markdown treesitter parsers from treesitter.lua; no browser or node needed.

-- The plugin's default icons are Nerd Font glyphs (private-use codepoints), which show
-- as "?" boxes without a Nerd Font. Strip them (and the space after) from every string.
local nerd_glyph = [=[[-\U000f0000-\U0010ffff] \=]=]
local function strip_glyphs(value)
  if type(value) == "string" then
    return vim.fn.substitute(value, nerd_glyph, "", "g")
  elseif type(value) == "table" then
    local out = {}
    for k, v in pairs(value) do out[k] = strip_glyphs(v) end
    return out
  end
  return value
end

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>m", "<cmd>RenderMarkdown toggle<cr>", ft = "markdown", desc = "Toggle markdown preview" },
    },
    opts = {
      enabled = false, -- show raw markdown until toggled on
      -- no html/latex parsers installed; skip those features
      html = { enabled = false },
      latex = { enabled = false },
      sign = { enabled = false }, -- no gutter icons next to headings / code blocks
      -- plain unicode replacements for icons that would otherwise just disappear
      heading = { icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " } },
      checkbox = {
        unchecked = { icon = "☐ " },
        checked = { icon = "☑ " },
        custom = { todo = { rendered = "◐ " } },
      },
    },
    config = function(_, opts)
      local rm = require("render-markdown")
      rm.default = strip_glyphs(rm.default)
      rm.setup(opts)
    end,
  },
}
