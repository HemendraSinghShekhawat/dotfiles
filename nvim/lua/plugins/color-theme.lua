return {
  {
    'phha/zenburn.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   vim.cmd.colorscheme 'zenburn'
    -- end,
  },
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      -- vim.cmd.hi 'Comment gui=none'
      --
      -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
      -- vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
      -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#51B3EC', bold = true })
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'catppuccin'
    --   -- You can configure highlights by doing something like
    --   -- vim.cmd.hi 'Comment gui=none'
    --   -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#51B3EC', bold = true })
    --   -- vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
    --   -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#51B3EC', bold = true })
    -- end,
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup {
  --       variant = 'auto', -- auto, main, moon, or dawn
  --       dark_variant = 'main', -- main, moon, or dawn
  --       dim_inactive_windows = false,
  --       extend_background_behind_borders = true,
  --
  --       enable = {
  --         terminal = true,
  --         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --         migrations = true, -- Handle deprecated options automatically
  --       },
  --
  --       styles = {
  --         bold = true,
  --         italic = true,
  --         transparency = false,
  --       },
  --
  --       groups = {
  --         border = 'muted',
  --         link = 'iris',
  --         panel = 'surface',
  --
  --         error = 'love',
  --         hint = 'iris',
  --         info = 'foam',
  --         note = 'pine',
  --         todo = 'rose',
  --         warn = 'gold',
  --
  --         git_add = 'foam',
  --         git_change = 'rose',
  --         git_delete = 'love',
  --         git_dirty = 'rose',
  --         git_ignore = 'muted',
  --         git_merge = 'iris',
  --         git_rename = 'pine',
  --         git_stage = 'iris',
  --         git_text = 'rose',
  --         git_untracked = 'subtle',
  --
  --         h1 = 'iris',
  --         h2 = 'foam',
  --         h3 = 'rose',
  --         h4 = 'gold',
  --         h5 = 'pine',
  --         h6 = 'foam',
  --       },
  --
  --       highlight_groups = {
  --         -- Comment = { fg = "foam" },
  --         -- VertSplit = { fg = "muted", bg = "muted" },
  --       },
  --
  --       before_highlight = function(group, highlight, palette)
  --         -- Disable all undercurls
  --         -- if highlight.undercurl then
  --         --     highlight.undercurl = false
  --         -- end
  --         --
  --         -- Change palette colour
  --         -- if highlight.fg == palette.pine then
  --         --     highlight.fg = palette.foam
  --         -- end
  --       end,
  --     }
  --
  --     vim.cmd 'colorscheme rose-pine'
  --     -- vim.cmd("colorscheme rose-pine-main")
  --     -- vim.cmd("colorscheme rose-pine-moon")
  --     -- vim.cmd("colorscheme rose-pine-dawn")
  --     -- vim.cmd.colorscheme 'gruber-darker'
  --   end,
  -- },
  {
    'blazkowolf/gruber-darker.nvim',
    name = 'gruber-darker',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'gruber-darker'
    end,
  },
}
