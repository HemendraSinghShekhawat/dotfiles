return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires special font.
    --  If you already have a Nerd Font, or terminal set up with fallback fonts
    --  you can enable this
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of help_tags options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    require('telescope').setup {
      defaults = {
        -- bottom_pane = {
        --   height = 25,
        --   preview_cutoff = 120,
        --   prompt_position = 'top',
        -- },
        -- center = {
        --   height = 0.4,
        --   preview_cutoff = 40,
        --   prompt_position = 'top',
        -- },
        -- cursor = {
        --   height = 0.9,
        --   preview_cutoff = 40,
        --   width = 0.8,
        -- },
        -- horizontal = {
        --   height = 0.9,
        --   preview_cutoff = 120,
        --   prompt_position = 'bottom',
        --   width = 0.95,
        -- },
        -- vertical = {
        --   height = 0.9,
        --   preview_cutoff = 40,
        --   prompt_position = 'bottom',
        --   width = 0.95,
        -- },
        layout_strategy = 'horizontal',
        layout_config = {
          preview_width = 0.65,
          bottom_pane = {
            height = 25,
            preview_cutoff = 120,
            prompt_position = 'top',
          },
          center = {
            height = 0.4,
            preview_cutoff = 40,
            prompt_position = 'top',
            width = 0.5,
          },
          cursor = {
            height = 0.9,
            preview_cutoff = 40,
            width = 0.8,
          },
          horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = 'bottom',
            width = 0.8,
          },
          vertical = {
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = 'bottom',
            width = 0.8,
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>of', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>fB', builtin.builtin, { desc = '[f]ind [B]uiltin Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, {
      desc = '[f]ind current [w]ord',
      -- word_match = '-w',
      -- short_path = true,
      -- only_sort_text = true,
      -- layout_strategy = 'vertical',
    })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>op', builtin.oldfiles, { desc = 'Telescope [O]pen [P]revious Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>ob', builtin.buffers, { desc = 'Telescope [O]pen [b]uffers' })

    -- vim.keymap.set('<space>f/', 'grep_open_files', {
    --   layout_strategy = 'vertical',
    -- })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>on', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    -- for media files
    --   require('telescope').setup {
    --     extensions = {
    --       media_files = {
    --         -- filetypes whitelist
    --         -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --         filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
    --         -- find command (defaults to `fd`)
    --         find_cmd = 'rg',
    --       },
    --     },
    --   }
    --   require('telescope').extensions.media_files.media_files()
    --   vim.keymap.set('n', '<leader>oi', '<cmd>Telescope media_files<cr>', { desc = '[O]pen [I]mages' })
  end,
}
