return {
  -- Load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  {
    -- Diagnostics
    "folke/trouble.nvim",
    opts = {
      focus = true,
      win = { type = "float" },
      keys = {
        ["<cr>"] = "jump_close",
      },
    },
  },

  -- Git conflict
  { "akinsho/git-conflict.nvim", config = true },

  -- Console log
  {
    "chrisgrieser/nvim-chainsaw",
    event = "VeryLazy",
    opts = {}, -- required even if left empty
  },

  -- Vim discipline
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },

  -- Cursor movement
  {
    "chrisgrieser/nvim-spider",
    config = function()
      -- No additional configuration is required by default
      -- You can map Spider motions as needed
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
      vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
    end,
  },

  -- Git line blame
  {
    "tveskag/nvim-blame-line",
    config = function()
      vim.g.blameLineGitFormat = "%an | %ar"
    end,
  },

  -- rpabon start screen
  {
    "folke/snacks.nvim",
    opts = {
      trouble = {
        win = {
          position = "float",
          style = "minimal",
          border = "rounded",
        },
      },
      dashboard = {
        preset = {
          header = [[
                             __                         
                            |  \                        
   ______   ______   ______ | ▓▓____   ______  _______  
  /      \ /      \ |      \| ▓▓    \ /      \|       \ 
 |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ \▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\
 | ▓▓   \▓▓ ▓▓  | ▓▓/      ▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓
 | ▓▓     | ▓▓__/ ▓▓  ▓▓▓▓▓▓▓ ▓▓__/ ▓▓ ▓▓__/ ▓▓ ▓▓  | ▓▓
 | ▓▓     | ▓▓    ▓▓\▓▓    ▓▓ ▓▓    ▓▓\▓▓    ▓▓ ▓▓  | ▓▓
  \▓▓     | ▓▓▓▓▓▓▓  \▓▓▓▓▓▓▓\▓▓▓▓▓▓▓  \▓▓▓▓▓▓ \▓▓   \▓▓
          | ▓▓                                          
          | ▓▓                                          
           \▓▓                                          
         ]],
        },
      },
    },
  },

  -- FZFLua
  -- {
  --   "ibhagwan/fzf-lua",
  --   event = "VeryLazy",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   -- config = function()
  --   --   require("fzf-lua").setup({
  --   --     grep = {
  --   --       rg_opts = "--column --line-number --no-heading --color=always --smart-case --fixed-strings",
  --   --     },
  --   --     files = {
  --   --       fd_opts = "--exclude node_modules",
  --   --     },
  --   --   })
  --   -- end,
  -- },

  -- Telescope config
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules" },
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- Better TS errors
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = {
      keymaps = {
        toggle = "<leader>dd", -- default '<leader>dd'
        go_to_definition = "<leader>dx", -- default '<leader>dx'
      },
    },
  },

  -- Indent rainbow
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function(_, opts)
      -- Other blankline configuration here
      return require("indent-rainbowline").make_opts(opts)
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },

  -- Minimap
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false,
    init = function()
      -- The following options are recommended when layout == "float"
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36 -- Set a large value

      --- Put your configuration here
      vim.g.neominimap = {
        auto_enable = true,
      }
    end,
  },

  -- Noice
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
  --   opts = {
  --     routes = {
  --       {
  --         filter = {
  --           event = "notify",
  --           find = "Request textDocument/inlayHint failed",
  --         },
  --         opts = { skip = true },
  --       },
  --       -- {
  --       --   filter = {
  --       --     event = "notify",
  --       --     find = "editorInfo",
  --       --   },
  --       --   opts = { skip = true },
  --       -- },
  --     },
  --   },
  -- },

  -- Fold groups
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" },
  --   config = function()
  --     -- Add your nvim-ufo configuration here
  --     require("ufo").setup()
  --   end,
  -- },
}
