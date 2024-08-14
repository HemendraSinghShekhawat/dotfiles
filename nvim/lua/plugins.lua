-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.

return {
  { 'tpope/vim-sleuth' },
  { 'numToStr/Comment.nvim', opts = {} },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettierd', 'prettier' } },
      },
    },
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va
      -- [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      require('mini.statusline').setup()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',

  -- importing custom plugins
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup { -- Optional, you don't have to run setup.
        groups = { -- table: default groups
          'Normal',
          'NormalNC',
          'Comment',
          'Constant',
          'Special',
          'Identifier',
          'Statement',
          'PreProc',
          'Type',
          'Underlined',
          'Todo',
          'String',
          'Function',
          'Conditional',
          'Repeat',
          'Operator',
          'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          -- 'CursorLine',
          -- 'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {}, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      }
    end,
  },
  -- {
  --   'nvimtools/none-ls.nvim',
  --   config = function()
  --     local null_ls = require 'null-ls'
  --     null_ls.setup {
  --       sources = {
  --         null_ls.builtins.formatting.stylua,
  --         null_ls.builtins.diagnostics.eslint,
  --         null_ls.builtins.completion.spell,
  --       },
  --     }
  --
  --     local no_really = {
  --       method = null_ls.methods.DIAGNOSTICS,
  --       filetypes = { 'markdown', 'text' },
  --       generator = {
  --         fn = function(params)
  --           local diagnostics = {}
  --           -- sources have access to a params object
  --           -- containing info about the current file and editor state
  --           for i, line in ipairs(params.content) do
  --             local col, end_col = line:find 'really'
  --             if col and end_col then
  --               -- null-ls fills in undefined positions
  --               -- and converts source diagnostics into the required format
  --               table.insert(diagnostics, {
  --                 row = i,
  --                 col = col,
  --                 end_col = end_col + 1,
  --                 source = 'no-really',
  --                 message = "Don't use 'really!'",
  --                 severity = vim.diagnostic.severity.WARN,
  --               })
  --             end
  --           end
  --           return diagnostics
  --         end,
  --       },
  --     }
  --
  --     null_ls.register(no_really)
  --   end,
  -- },
  -- {
  --   'https://github.com/adelarsq/image_preview.nvim',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('image_preview').setup()
  --     require('neo-tree').setup {
  --       filesystem = {
  --         window = {
  --           mappings = {
  --             ['I'] = 'image_wezterm', -- " or another map
  --           },
  --         },
  --         commands = {
  --           image_wezterm = function(state)
  --             local node = state.tree:get_node()
  --             if node.type == 'file' then
  --               require('image_preview').PreviewImage(node.path)
  --             end
  --           end,
  --         },
  --       },
  --     }
  --   end,
  -- },
  { 'ThePrimeagen/vim-be-good' },
}
