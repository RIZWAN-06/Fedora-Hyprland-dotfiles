return {
  { "folke/tokyonight.nvim", enabled = false },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
      },
      integrations = {
        blink_cmp = true,
        bufferline = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = { enabled = true },
        native_lsp = { enabled = true },
        noice = true,
        notify = true,
        snacks = { enabled = true },
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")

      -- Force transparency on key highlight groups (runs AFTER colorscheme loads)
      local transparent_groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "FloatTitle",
        "SignColumn",
        "EndOfBuffer",
        "LineNr",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "TabLine",
        "TabLineFill",
        "WinSeparator",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "WhichKeyFloat",
        "WhichKeyBorder",
        "LazyNormal",
        "LazyButton",
        "LazyButtonActive",
        "MasonNormal",
        "SnacksNormal",
        "SnacksDashboardNormal",
        "CmpNormal",
        "CmpBorder",
        "CmpPmenu",
        "NoicePopup",
        "NoicePopupBorder",
        "NoiceCmdlinePopup",
        "NotifyINFOBody",
        "NotifyWARNBody",
        "NotifyERRORBody",
        "NotifyDEBUGBody",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
      }
      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
      end
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
